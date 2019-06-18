Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD274A4BF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 17:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728982AbfFRPGB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 11:06:01 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38327 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728572AbfFRPGB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 11:06:01 -0400
Received: by mail-wm1-f66.google.com with SMTP id s15so3638218wmj.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Jun 2019 08:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=07mk1JtBZ/+YPj007/kGcykf9KiSTVz87ZXH8/pz9sc=;
        b=bDdKT0WTIJG3sIrc1QPYLmgqn9K7Sana3QWGfvLwGx6TVesXi7QdI0wFdW1xPNoGWr
         mK7rP82vMuT1orVPcORT/qRYHf43wf06TKIdRbKhJu6DM9gPfJ5BVCI++QReiEplNHUC
         51YXIs5yWUmr4HMzBMGfjmYut81FEUTbAeDD9rhPZZWodhPiOc0Kxaj5HLMGZ8vK8olq
         dw1vy1MSBhRKLjSe9gHtFh9SvDdqR27a9OXXOXGYvpt7wPX+oUHBK9QzkbC+jzSitw5a
         XT2KLv/Dd0Q4IM2uRzXWfoPIFqytFk9AbqxuS3aqI+e1BpDUN4UhPILULSsryH0tVmzM
         ecSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=07mk1JtBZ/+YPj007/kGcykf9KiSTVz87ZXH8/pz9sc=;
        b=MGwPo8AwCsTsbjUMvZOxilYhZ2SlHYFat84NowybJoVyhPczsahLpvT2sMaV//QRbn
         neF2O/gw0wTZvmo3RFkc6+H4gb7FxLGC0bMhVOzQtpp3VG7N1mVmhb5cush+Wqae9Pj4
         TTcn/DSYwbFY4I18QEk2ps6BgLUmNq/ZMWUxvygc2q5wn72sVVDGe5X0Sl9Z79yu5Xm0
         E3GlL6hlXwrIm0Xc4R/8IcHq/R2rBimW+sqNYl29qiBw/A9O3jRkuXbWtLwkR+v/YpTV
         4fsD6FfYwCMPJjhVsXos6oCSKqA1BMaGN4g/OhuSRcYXoaLnRakQkSkwQOWgw0M2nk1D
         EQBw==
X-Gm-Message-State: APjAAAVZ+3qApfqeaVtQitEGd/1sG2eZ81mC6uctCDvdz+aU+NaSGWeU
        tqOmuSlz39NaoAVOOODKT18F15kctsHsqsUXzvU=
X-Google-Smtp-Source: APXvYqxMzAPDb8o+qhkCyAkR8XNDNOtE5twTKO3mzDjFahkDovaAK0WjAKAkQW3Fm1Y3kpZ+7Uj7B3fOqFD/Ec85pyY=
X-Received: by 2002:a05:600c:228b:: with SMTP id 11mr4187472wmf.26.1560870359143;
 Tue, 18 Jun 2019 08:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <156076300266.5827.16345352064689583105.sendpatchset@octo>
 <156076301133.5827.18087893489480810339.sendpatchset@octo> <CAMuHMdXrDMuhOSuFNYmAxX+vZWWL3GqKKsz6OiBkpeGrgg_ZTg@mail.gmail.com>
In-Reply-To: <CAMuHMdXrDMuhOSuFNYmAxX+vZWWL3GqKKsz6OiBkpeGrgg_ZTg@mail.gmail.com>
From:   Magnus Damm <magnus.damm@gmail.com>
Date:   Wed, 19 Jun 2019 00:05:46 +0900
Message-ID: <CANqRtoSGJsE-DqZK5_Tgb-awcUSDnRzyK-6CwS4DgtrRQ0AdVg@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: Update CMT1 DT compat strings on r8a7740
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Tue, Jun 18, 2019 at 11:08 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Magnus,
>
> On Mon, Jun 17, 2019 at 11:16 AM Magnus Damm <magnus.damm@gmail.com> wrote:
> > From: Magnus Damm <damm+renesas@opensource.se>
> >
> > Update the r8a7740 to use the CMT1 DT compat string documented in:
> > [PATCH 2/8] dt-bindings: timer: renesas, cmt: Update CMT1 on sh73a0 and r8a7740
> >
> > The "renesas,cmt-48" portion is left as-is to avoid breakage until the CMT
> > driver has been updated to make use of the new DT compat strings.
>
> Hence wouldn't it be better to update the driver first, and the DTS in
> the next release, so you can remove the "renesas,cmt-48" portion with
> the single DTS update?

Changing the DTS once sounds nice indeed. I guess my current series
are optimized for easy merge of DT Binding docs and DTS. The driver
changes are considered slow path.

Regarding the driver itself, I was under the impression that
introducing new DT compat strings is often disconnected from removing
old DT compat strings. Do you agree?

This is how I understand your proposed order:

Step 1:
- Update DT binding document to include new compat strings, remove
deprecated compat strings
- Add new DT compat string matching code to the driver
- Mark old DT compat strings in driver as deprecated

Step 2: (Any time after step 1 is complete)
- Convert DTS to use DT new compat strings

Step 3: (After N releases or years)
- Remove deprecated DT compat string matching code in driver

> This is how it was done for R-Car Gen2:
>
> v4.15 has commit 83c79a6d8d7f4821 ("clocksource/drivers/sh_cmt: Support
> separate R-Car Gen2 CMT0/1"),
> v4.16 has commit bf50e0ab4f5062bb ("ARM: dts: r8a7791: Update CMT compat
> strings").

Looking good!

Thanks for your help!

/ magnus
