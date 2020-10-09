Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 918962885BA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Oct 2020 11:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733000AbgJIJB3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Oct 2020 05:01:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732898AbgJIJB3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Oct 2020 05:01:29 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 237E8C0613D2;
        Fri,  9 Oct 2020 02:01:29 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id f70so6669797ybg.13;
        Fri, 09 Oct 2020 02:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PcsONVYiBK1iW5wQec5AEduVLgrfQM/jVP9jKaNXMYw=;
        b=YFABU5DIuDtk1xS6jIx3m5QXTG4r3ctCEX3KFO9+cszASBgOWa6k6Kj+OB8VHTB3Dx
         kbJg3XN5gO6SS6P0IiE5aafDLfz54lYlOjWkSl1GanA4tdlaQMrMX/t3jr0O8QNkWeGh
         eYYpEK5Y+cc0d9I0LVCseO3KfaqeCc+CidtTazeHd2dstS1ihByRfiqTGuUsGAvXVfuJ
         mo7fCRWpxs6jU+zengQvQGLCKim27Vppyd3QT9e2vctWUrBc8zXVOK+0D4Zkd7ZaNuu0
         1wuDS/0+0tSbVNivTS3zV2EJRT/6u9pggqMt64/WdQ1ZsjJvJL49c74E0y0+JULdg3st
         TGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PcsONVYiBK1iW5wQec5AEduVLgrfQM/jVP9jKaNXMYw=;
        b=eToPEGSW9DGVxpZQfJLDhWVfm5y2tdWKydv3GxkP5Yftki6Cplz+Bge8yH3W9wsGEw
         zsUCx1vdLsIO2V7sPYnk10oiNiofKUeRr5amhQFBphmddPsC6pd1ppRgfBHnkrR+SbLy
         XsDwWGGj8/Ejq6wawgcGkBBVEg0jZ0ffxk5kKAAKdjA+Cyz+hB2VCF/MEgSEkhsjBMp5
         dCuIW1ae0zkZgB8+d6KPU2ZMaD2FhJm9wMV59L8WHSFwCGHlqPOIWOJv5vHFvbDSJsSl
         auut5YpM0n+VUtWbhDy1zvDq1OJml8Bq5VIPXUDceEOOoWH9xZezGdHFV/nyMDQCHFx0
         T9ug==
X-Gm-Message-State: AOAM531rQaNX1Fm2STLBpNK+em0dEt7hW0jyT/ob3y32mqPilffiO4zy
        n3SSrCXCkUM5OzmqRJAyUMWqlbiFc2GFGlulLls=
X-Google-Smtp-Source: ABdhPJwEfupS5lSsaPNUhRbQTRDTmsZzTkwL0spN3NS0/dLm4LwSlwo/2fwEZYM8rtLoxyFlz9ezQ1aeCKE1032fMwc=
X-Received: by 2002:a25:37c2:: with SMTP id e185mr1971300yba.401.1602234088498;
 Fri, 09 Oct 2020 02:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200825162718.5838-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200825162718.5838-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20201009072350.GB10335@amd>
In-Reply-To: <20201009072350.GB10335@amd>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 9 Oct 2020 10:01:02 +0100
Message-ID: <CA+V-a8uw7+U=cnqQqiHAt4z6BzrSKQdAC01JKvgcry9y23Vd5A@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: r8a7742-iwg21d-q7: Enable PCIe Controller
To:     Pavel Machek <pavel@denx.de>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Pavel,

Thank you for the review.

On Fri, Oct 9, 2020 at 8:23 AM Pavel Machek <pavel@denx.de> wrote:
>
> Hi!
>
> > +&pciec {
> > +     /* SW2[6] determines which connector is activated
> > +      * ON = PCIe X4 (connector-J7)
> > +      * OFF = mini-PCIe (connector-J26)
> > +      */
> > +     status = "okay";
> > +};
>
> Note this is wrong comment style for non-network parts of kernel.
>
Good point, i'll fix that.

Cheers,
Prabhakar
