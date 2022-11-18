; ModuleID = 'test1.ls.bc'
source_filename = "test1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %A = alloca [2048 x i32], align 16
  %B = alloca [2048 x i32], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 2048
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [2048 x i32], [2048 x i32]* %A, i64 0, i64 %idxprom
  %2 = load i32, i32* %arrayidx, align 4
  %3 = load i32, i32* %i, align 4
  %idxprom1 = sext i32 %3 to i64
  %arrayidx2 = getelementptr inbounds [2048 x i32], [2048 x i32]* %B, i64 0, i64 %idxprom1
  store i32 %2, i32* %arrayidx2, align 4
  %4 = load i32, i32* %i, align 4
  %add = add nsw i32 %4, 1
  %idxprom3 = sext i32 %add to i64
  %arrayidx4 = getelementptr inbounds [2048 x i32], [2048 x i32]* %A, i64 0, i64 %idxprom3
  %5 = load i32, i32* %arrayidx4, align 4
  %6 = load i32, i32* %i, align 4
  %add5 = add nsw i32 %6, 1
  %idxprom6 = sext i32 %add5 to i64
  %arrayidx7 = getelementptr inbounds [2048 x i32], [2048 x i32]* %B, i64 0, i64 %idxprom6
  store i32 %5, i32* %arrayidx7, align 4
  %7 = load i32, i32* %i, align 4
  %add8 = add nsw i32 %7, 2
  %idxprom9 = sext i32 %add8 to i64
  %arrayidx10 = getelementptr inbounds [2048 x i32], [2048 x i32]* %A, i64 0, i64 %idxprom9
  %8 = load i32, i32* %arrayidx10, align 4
  %9 = load i32, i32* %i, align 4
  %add11 = add nsw i32 %9, 2
  %idxprom12 = sext i32 %add11 to i64
  %arrayidx13 = getelementptr inbounds [2048 x i32], [2048 x i32]* %B, i64 0, i64 %idxprom12
  store i32 %8, i32* %arrayidx13, align 4
  %10 = load i32, i32* %i, align 4
  %add14 = add nsw i32 %10, 3
  %idxprom15 = sext i32 %add14 to i64
  %arrayidx16 = getelementptr inbounds [2048 x i32], [2048 x i32]* %A, i64 0, i64 %idxprom15
  %11 = load i32, i32* %arrayidx16, align 4
  %12 = load i32, i32* %i, align 4
  %add17 = add nsw i32 %12, 3
  %idxprom18 = sext i32 %add17 to i64
  %arrayidx19 = getelementptr inbounds [2048 x i32], [2048 x i32]* %B, i64 0, i64 %idxprom18
  store i32 %11, i32* %arrayidx19, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %13 = load i32, i32* %i, align 4
  %add20 = add nsw i32 %13, 4
  store i32 %add20, i32* %i, align 4
  br label %for.cond, !llvm.loop !4

for.end:                                          ; preds = %for.cond
  %14 = load i32, i32* %retval, align 4
  ret i32 %14
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
