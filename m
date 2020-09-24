Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D27D327790A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Sep 2020 21:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728769AbgIXTRb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Sep 2020 15:17:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726899AbgIXTR2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Sep 2020 15:17:28 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34693C0613CE
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2020 12:17:28 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id o8so275546ejb.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2020 12:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HlMEqaH4jhYqCTz0wu4Oc4i9HNKGhrDPTv+dOwWSePs=;
        b=YBISHKg5nbfsJZNo8LSEFKBAgMnlBByRLtEeUtT5KiKFNIB6Jdl08rvl1im6rfFiw6
         PirNQwdfOgYHAEAffcse6XuzD0N876wfLl5oZSmEYnLgMWr4DCWSK5lLb4x7rJpF8fiG
         zNj8wPnA/GF1m3Qc2lgxLeIuBczFuEc2vtMB3l3ktQ2zZCnydMAOeiDAcgv7AijqaYcc
         Mv0+vNGJFSF0/hAqa0oG6IexyOKbJ1KDchmh6RxKsKZQc9tr5382DgOf87fa1HqOa6jz
         NGKve4NtFoePDkbfVnN6fHfmxb6AS+LZYMCj9nTkC7OWtKizZ3wJZT4oyr67cpZSGcRV
         Tu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HlMEqaH4jhYqCTz0wu4Oc4i9HNKGhrDPTv+dOwWSePs=;
        b=al7wmvlKtpIxAXFBLnNKlBTj0avX3zQQhz/VLjZIr6ZPeJ25X1r1m2G8csb778fOxq
         jgJajW4gg1W2uuheejusLvDFZD3SdEAm3JjPQsoEKsfvzCmMsGSd5QgSGhwrJa79QRNw
         Za0Zt6k85vy9lMUhChLHN9wZXFYJJWzktTJLACVugfTodfRwq9xzeH1eRH4w2wBdhv/l
         Lp1Q+MzdKxBX3H2kh/jWhFuX3P00NOstXL1CM9z627TYnLnVxfn+zr4ii+wdS7owU1nR
         PoBn2WehfX2zFgmWa4W8eIqdNDCkceuOBHqLg6Ok30Hw0zdqxTo8nIxZnDAUmJxlunSv
         2tRA==
X-Gm-Message-State: AOAM533R1T2m3IPfSmZFRa7YRgtTS6s5AEXx0gkMy3ImKWqLqm9hUB0u
        wu6pGQ8rglXah24FjMlwWPU=
X-Google-Smtp-Source: ABdhPJygTnKRXDDTN3oer+kVW6cMHSIOj/lT22U5S2aUF/qGMV0hIiBOXCIdKP1H4A1HgDx49jSqng==
X-Received: by 2002:a17:906:1e51:: with SMTP id i17mr136969ejj.103.1600975046868;
        Thu, 24 Sep 2020 12:17:26 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7fe:f700:ec59:f6e1:1368:c855])
        by smtp.gmail.com with ESMTPSA id j9sm230114ejt.49.2020.09.24.12.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 12:17:26 -0700 (PDT)
Date:   Thu, 24 Sep 2020 21:17:25 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     kernel test robot <lkp@intel.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        kbuild-all@lists.01.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Gareth Williams <gareth.williams.jx@renesas.com>
Subject: Re: [renesas-drivers:sh-pfc-for-v5.10 5/8]
 drivers/pinctrl/sh-pfc/pinctrl-rzn1.c:183:52: sparse: sparse: dubious: x |
 !y
Message-ID: <20200924191725.fhqrx5xvv3u7j55c@ltop.local>
References: <202009231915.Vn6RelQX%lkp@intel.com>
 <CAMuHMdV=aWj9ePL9gAa-vsmLLUZkY4ip2337am8A7ktxg7Yniw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV=aWj9ePL9gAa-vsmLLUZkY4ip2337am8A7ktxg7Yniw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Thu, Sep 24, 2020 at 10:01:57AM +0200, Geert Uytterhoeven wrote:
> Hi Kernel test robot,
> 
> CC Gareth, Luc,
> 
> > sparse warnings: (new ones prefixed by >>)
> >
> > >> drivers/pinctrl/sh-pfc/pinctrl-rzn1.c:183:52: sparse: sparse: dubious: x | !y
> >    drivers/pinctrl/sh-pfc/pinctrl-rzn1.c:189:52: sparse: sparse: dubious: x | !y
> 
> I believe the code is correct (see below).
> 
> > 4e53b5004745ef drivers/pinctrl/pinctrl-rzn1.c Phil Edworthy 2018-09-26  180      * address | 1.
> > 4e53b5004745ef drivers/pinctrl/pinctrl-rzn1.c Phil Edworthy 2018-09-26  181      */
> > 4e53b5004745ef drivers/pinctrl/pinctrl-rzn1.c Phil Edworthy 2018-09-26  182     if (lock & LOCK_LEVEL1) {
> > 4e53b5004745ef drivers/pinctrl/pinctrl-rzn1.c Phil Edworthy 2018-09-26 @183             u32 val = ipctl->lev1_protect_phys | !(value & LOCK_LEVEL1);
> 
> IMHO this is correct: ipctl->lev1_protect_phys is to be ORed with 0 or 1,
> depending on whether LOCK_LEVEL1 is set or nor.
> 
> Is there a way to inform sparse this code is correct?

Not really, at least no kind of annotation to suppress the warning
(and I don't think it would be a good idea to have one). But of
course, since the warning is about the possible error of mixing
a bitwise and with a logical not, you can rewrite the expression as:
	u32 val = ipctl->lev1_protect_phys | ((value & LOCK_LEVEL1) == 0);
or, better;
	u32 val = ipctl->lev1_protect_phys | ((value & LOCK_LEVEL1) ? 0  1);

But I understand quite well why people would prefer the simpler, more
idiomatic !(value & LOCK_LEVEL1).

Best regards,
-- Luc
