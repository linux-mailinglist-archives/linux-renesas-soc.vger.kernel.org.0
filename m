Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 273E928855D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Oct 2020 10:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732806AbgJIIeV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Oct 2020 04:34:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732758AbgJIIeU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Oct 2020 04:34:20 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A311BC0613D2;
        Fri,  9 Oct 2020 01:34:18 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id 67so6635062ybt.6;
        Fri, 09 Oct 2020 01:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2L4Z60y4H9EDAfsYotDNv8cFBrjpmybuc3nSYCgHVY4=;
        b=vHw74wOeqHMUnWPc0RXBbjYyWBenl8fVoXSF3QKVpIpQ0hjBmmkvCL1FyyxWbNPLsU
         SpCct8ZXFXM16eAoVeC1OqdSPOln3d1fz7TGBMErCHG2WIIPlESZvMkmGlm3/iAql6z7
         dqdkuQh2KABglxNjTWHEYlHuaGsCiD63JHsZ82jGNhCiXMZLVg7ffBCEa/6SWolrRIBv
         gGzdea4iP51r6Xa71G11bW9xW8diDFPKgTjKlK7R0gj9yFbxw9fJoRIw2bhwQN5S8EVb
         HDWrtT0ZtVijbskBNsk96aKQBJqoCqiKk2DMBChvmQ/y4WVks/EAREklQyn4xL6J97KS
         uiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2L4Z60y4H9EDAfsYotDNv8cFBrjpmybuc3nSYCgHVY4=;
        b=CmYhAX0Vxh3Z2Zg0Na231i9nFmLsxrw8LLYuHEAUGHcUeGGClkEWa3/3xgoL9+SjYG
         scn7CnPk/XLcAbyxNiYNdYykHqnTcaB2sbSU8L8+LQ3drHQFa6bYD8v2omaL1XJrrkoD
         lAM/g79CqrI9CczbavXraeslNPyojKCPnwJ62CZD54HiMBs3l1L3IhhTaWXwEuKUEGpr
         jhXXFOAqfOh3t+ZyB7CDVPr1KT2ppbdSuCg3cSAUyQqqexXWD9jBR41FJ8gQt+ShPTvs
         Ss6KgVTeQVXSk8vXKLEmXS4xyxfWiJkhBcs0amHGS3gZWUl1hbcPk3/AztuffmYThdDI
         BXdQ==
X-Gm-Message-State: AOAM532wJcX49VvPCBljj59ICr9TbJGof33OAIDx3C3bTPdtM9/8pZNQ
        LvonZ55lraOknexX4jo/1pvo3WPqQlrsoOxyoZVW1tH06PApPe+P
X-Google-Smtp-Source: ABdhPJz2T+pQRsbMSfuJSs2HYk5QGzEEgrESzEQ2ok/0t9NYX2jHwcUhnC1WN0DK629ULyE4VUUs52UXArEsEcMgNPM=
X-Received: by 2002:a25:5507:: with SMTP id j7mr16662411ybb.214.1602232457859;
 Fri, 09 Oct 2020 01:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201006112701.11800-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201006112701.11800-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <20201009074809.GE10335@amd>
In-Reply-To: <20201009074809.GE10335@amd>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 9 Oct 2020 09:33:51 +0100
Message-ID: <CA+V-a8tLuC7j_rbvwVaJ3EDD4YtUc9CvQaZNYY7GUZbOt-yhyg@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: Add support for MIPI Adapter
 V2.1 connected to HiHope RZ/G2H
To:     Pavel Machek <pavel@denx.de>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Pavel,

Thank you for the review.

On Fri, Oct 9, 2020 at 8:48 AM Pavel Machek <pavel@denx.de> wrote:
>
> Hi!
>
> > index 000000000000..c62ddb9b2ba5
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi
> > @@ -0,0 +1,109 @@
> > +// SPDX-License-Identifier: GPL-2.0
>
> dts files are normally dual-licensed...?
>
All the Renesas dts files are GPL-2.0

Cheers,
Prabhakar
