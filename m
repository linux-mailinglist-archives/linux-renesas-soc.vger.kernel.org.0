Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E21B88A07
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Aug 2019 10:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725763AbfHJIcD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 10 Aug 2019 04:32:03 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43377 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbfHJIcC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 10 Aug 2019 04:32:02 -0400
Received: by mail-lf1-f67.google.com with SMTP id c19so71184433lfm.10
        for <linux-renesas-soc@vger.kernel.org>; Sat, 10 Aug 2019 01:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GVHoD/kFYG2+UKWyfR9Vz4jg8lLzKuoZVZM/VErCL8E=;
        b=Goy+1fh1bV3JbOPmD7gfeGw8Pplhqu/VgLRSSwuu3/OCtZ7lCDjYAKEt6SmsMIL4+m
         7snSUOSn3Igv+Bh9uN2NDvgCwwpGIr95+t1b7FHoMSG/KVEKw3uaZEQyYt0Sw12CZims
         Gs/i3TIV0zOBLQjI+uIx4rOFg1rglgnVfVe3VXJY2wO/vOv97sLTt6oKPDMlkie7+LCx
         XW/BNRpSp7F5+Q+XnlVceamffP7LlFnNtuG3CN6B9GTKG3VEd9y4rKZt397gK83ycuV7
         MVRP662N8F/INq+TdYktgAy71fNps9sL/e7liwlVgAl/WoC5DWLbOsio9zLr5qluhtzT
         +lfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GVHoD/kFYG2+UKWyfR9Vz4jg8lLzKuoZVZM/VErCL8E=;
        b=kahefdV3PtSZcKsN/r8kGfRFQkcK4SxAv54W1xzr6daGcfS84HvIR2scN3J4nP3vrq
         HWA0Q3JkBvzcaxAFVwpeV2ECVnq0Aa1qD+m7ZOFc/P3qi+5d/rfq3ymCCF6JhkpaT6kX
         luJw1QS2F5AVb/tcvXZyK3+fXZrmgu2llJY2JMRTJ6yER7XYyff9g7Mw1VQsNxiHUCQC
         oYWRWfkK13Z5/oPeCY/loRq6kSwijLIx751rADv1zKA6gZtmc3FdtTcLMCEA7K4xE3i0
         AWbmDZAO7cFI/lFpusS5Ayny39OryP6q2R2JQwylAwO80yMGUAt6k3atqUjcRH4YFkO9
         LZzw==
X-Gm-Message-State: APjAAAVvBlZEdLZOacWmhw6cUqDKPfS28HYvyJ0ErjUHGxYGCNDVuRKF
        eTRP3+Jw5+agOl4SiIF4qZjfV1+hkX3gKk/Bz2WiRQ==
X-Google-Smtp-Source: APXvYqySUS5WDap6akhFSliYjDaWYZFixsK7mUC4osTLggtfhjnYzwKKRmx57CnB44C1+CD1hV7/vrs0/ZGAXQRE5Uc=
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr15392081lfp.61.1565425920681;
 Sat, 10 Aug 2019 01:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190809074420.27006-1-geert+renesas@glider.be>
In-Reply-To: <20190809074420.27006-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 10 Aug 2019 10:31:49 +0200
Message-ID: <CACRpkdY4hZ3kUMs6n-kway=rbp1bocpLsJ1qMAe64oC32NZA1w@mail.gmail.com>
Subject: Re: [git pull] pinctrl: sh-pfc: Updates for v5.4
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 9, 2019 at 9:44 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:
>
>   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.4-tag1
>
> for you to fetch changes up to 625efea83a7c37d281c6a90526813a1366929d24:
>
>   pinctrl: rza1: Use devm_platform_ioremap_resource() helper (2019-08-09 09:34:45 +0200)

Pulled into my "devel" branch, thanks!

Yours,
Linus Walleij
