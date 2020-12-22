Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF47C2E0D92
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Dec 2020 17:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbgLVQvq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Dec 2020 11:51:46 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.161]:35956 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727872AbgLVQvq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 11:51:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1608655674;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:From:
        Subject:Sender;
        bh=ttSGa0wMd849zddMwLMVsq2l4rJxLwucCsYRN0BS82w=;
        b=ioXqLk6tEo4s4beHIu4+N7mlbMMD7eXcfbFBk5ftyUoaZiox3l4APShZPz1NE+eK4x
        ytADc/Lm+n09cMDPN2nueNvn/YOXM1emZKdNsbZzXjRTt0tFEuvNO+q3fs82CMEnxBSa
        v4NhRsxJ9c88v98mHxaHibYhQTOfB1HypG5j+hdA4zxlEx1poTF4DnF7Qxk8Xere53wO
        HhC3wxOzdg5BBQmk19laTZj2XB+MwlOeJ2Szp+3VH5mAOTMbOgiYCnqHrVNQhmUMWHIU
        SQYzjHBZzgAgReWa/MgCo1DeB8nXOr35Hcv+R9I8oRWYq4f0Nurf+hzLWatr9ckhk2PW
        GDjQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fGk/2qthug="
X-RZG-CLASS-ID: mo00
Received: from oxapp03-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 47.10.3 AUTH)
        with ESMTPSA id n0843bwBMGlm0Nr
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 22 Dec 2020 17:47:48 +0100 (CET)
Date:   Tue, 22 Dec 2020 17:47:48 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Message-ID: <1392786155.217714.1608655668850@webmail.strato.com>
In-Reply-To: <CAMuHMdVH_Cb28M5RPjS6pDiguq_q23ri0KXNxGky4tA6xm0mGw@mail.gmail.com>
References: <20201221165448.27312-1-uli+renesas@fpond.eu>
 <20201221165448.27312-3-uli+renesas@fpond.eu>
 <CAMuHMdVH_Cb28M5RPjS6pDiguq_q23ri0KXNxGky4tA6xm0mGw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] pinctrl: renesas: add I/O voltage level flag
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev29
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On 12/22/2020 11:45 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > --- a/drivers/pinctrl/renesas/pinctrl.c
> > +++ b/drivers/pinctrl/renesas/pinctrl.c
> > @@ -634,6 +634,9 @@ static int sh_pfc_pinconf_get(struct pinctrl_dev *pctldev, unsigned _pin,
> >         }
> >
> >         case PIN_CONFIG_POWER_SOURCE: {
> > +               int idx = sh_pfc_get_pin_index(pfc, _pin);
> 
> I guess this cannot fail when we get here?

That would require a bug elsewhere, I think.

> > +               const struct sh_pfc_pin *pin = &pfc->info->pins[idx];
> > +               int lower_voltage;
> 
> unsigned int

Fair enough...

> mV_low?

That, though, seems ambiguous to me because it could refer to the logical-zero voltage.
(Are internal capital letters even permitted in identifiers?)

CU
Uli
