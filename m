Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4711E1ABC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2020 07:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbgEZFiy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 May 2020 01:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbgEZFix (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 May 2020 01:38:53 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C11A1C061A0E;
        Mon, 25 May 2020 22:38:53 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 131so1254253pfv.13;
        Mon, 25 May 2020 22:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=TEpwLFvhdJnR4rjU7Ugp7j/UBW4cby4V0E/lSlZIC2A=;
        b=dRqDkXAhUQqq4jKIqnZQcVMSc+nmulxIn8oBwA5cKzkJQBeQVkpu50Q4u+BhuUv1gH
         iSsk9QGdD6CEpil6jNcyOQ6GwppqEKhEjSNSnOBG204oomjvsOGyP+Nza/14py2CtuON
         sYN1JHc89qYwszU9hx8uqkyA8M81ruCWFGrBLh+cHmn59r2sxviOOZFHLEF7/yl5kNa7
         RrYXh9FBng/tXMbq8zkTC7wVjOZx1fvh7xZIj2fFN5eRop2lY7NgCJ3Ki++2DXfJc5hI
         bYvvh/uiHyY9c8tg2kkR1etcVQQyprHGXiS9iODGxU15LCQfz50k/z5hoSzh2G2I5q8K
         R6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=TEpwLFvhdJnR4rjU7Ugp7j/UBW4cby4V0E/lSlZIC2A=;
        b=Cge8cGhNeaMRGkjMIRW0Fr0ilINHdp6FFzWxohJvlXXfPn3OSWTULTpgeGlKJN+2o5
         7zWl8PDn37IiqafDtuV7qVtm+ZBOp3jkUA5CQctvuUs4EnEU4z288xx2yvGdUvVmFnHR
         7yjCfOkO1s5EJ3E3KIzfwlMeZYwWhjEzdlav9+YgN5Dlcpcfq131WXs6EUjSNcGnFxAW
         72Z5KwTO3K1V8gGkC+NnOjMgrts7EzUaZLOyCSJdNV2mxxCdtdbJQcQJ4mIuA31hVMxR
         vtIy72El/cOYr0gsJcXJ1l9X8gPNZBmE+WkMyNR1KhnVD4mqGDzx8s2Rz+mWESQSWUBB
         asyQ==
X-Gm-Message-State: AOAM531k++wYGfx77HXExBgsojY/ZomXQ8mh3z+S/xUxBIHCBRmVjlRi
        K7sqNr5CAap4BXOiQpM1Lf1ba47e
X-Google-Smtp-Source: ABdhPJwU6+yb4CNaNP614xORlUHrKpQ8SmzJEas/bYBWmkz6zcDW8qqB9KRkV689KfvC/QL6TxFnAg==
X-Received: by 2002:a63:d148:: with SMTP id c8mr29277363pgj.51.1590471533034;
        Mon, 25 May 2020 22:38:53 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id y6sm14105508pjw.15.2020.05.25.22.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 22:38:52 -0700 (PDT)
Date:   Mon, 25 May 2020 22:38:50 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>
Cc:     Anders Roxell <anders.roxell@linaro.org>, geert+renesas@glider.be,
        magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org,
        sre@kernel.org, robh@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] power: reset: vexpress: fix build issue
Message-ID: <20200526053850.GA2368760@ubuntu-s3-xlarge-x86>
References: <20200522220103.908307-1-anders.roxell@linaro.org>
 <20200524222025.GA3116034@ubuntu-s3-xlarge-x86>
 <292277.1590449865@turing-police>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <292277.1590449865@turing-police>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, May 25, 2020 at 07:37:45PM -0400, Valdis Klētnieks wrote:
> On Sun, 24 May 2020 15:20:25 -0700, Nathan Chancellor said:
> 
> > arm-linux-gnueabi-ld: drivers/power/reset/vexpress-poweroff.o: in function `vexpress_reset_probe':
> > vexpress-poweroff.c:(.text+0x36c): undefined reference to `devm_regmap_init_vexpress_config'
> 
> The part I can't figure out is that git blame tells me there's already an
> export:
> 
> 3b9334ac835bb (Pawel Moll      2014-04-30 16:46:29 +0100 154)   return regmap;
> 3b9334ac835bb (Pawel Moll      2014-04-30 16:46:29 +0100 155) }
> b33cdd283bd91 (Arnd Bergmann   2014-05-26 17:25:22 +0200 156) EXPORT_SYMBOL_GPL(devm_regmap_init_vexpress_config);
> 3b9334ac835bb (Pawel Moll      2014-04-30 16:46:29 +0100 157)
> 
> but I can't figure out where or if drivers/power/reset/vexpress-poweroff.c gets
> a MODULE_LICENSE from...

Correct, it is exported but that file is being built as a module whereas
the file requiring it is beign builtin. As far as I understand, that
will not work, hence the error.

The issue with this patch is that ARCH_VEXPRESS still just selects
POWER_RESET_VEXPRESS, which ignores "depends on", hence the Kconfig
warning and not fixing the error.

I am not that much of a Kconfig guru to come up with a solution. I am
just reporting it because arm allmodconfig is broken on -next due to
this.

Cheers,
Nathan
