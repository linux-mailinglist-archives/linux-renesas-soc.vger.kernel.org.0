Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4642D291E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Dec 2020 11:42:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728752AbgLHKlt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Dec 2020 05:41:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727754AbgLHKlt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Dec 2020 05:41:49 -0500
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2748AC061749;
        Tue,  8 Dec 2020 02:41:09 -0800 (PST)
Received: by mail-yb1-xb43.google.com with SMTP id r127so15678265yba.10;
        Tue, 08 Dec 2020 02:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=p7rrbUd2GD8qSW4MR1E/gn6XTXa69KV3qccqhSvpT90=;
        b=qZ700TONe6wtSSOERiY7Wo59iFs3E7QSwaHUpbsfsu/Iuq/vAANipWoW2C8+7LDdYs
         RFUycp0spo4M4xFAc/a4L0yPdKFqPuOSIjJKg5ylus9uDSn4z4VIHJXvoGJOAaBZsUS5
         mMayD7Q8lGHnXAVm6ukPtUbLBWMpd5NLSb+HsiB+PvokgMBeeF2BLZANoX7ZifdNP+eC
         llpCYNdG5+Wr215Rhf4mAUIB6NIpxjqcPYbepEar//GGKuz7sR/81vQSmoNlqhvyyb8e
         fz58FtDYNbmroUwk0MUElCURKlzgfCDcyN/J+rfQjaF4cNutYBMSk0U829RTj3zQq6gq
         rp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=p7rrbUd2GD8qSW4MR1E/gn6XTXa69KV3qccqhSvpT90=;
        b=PZsEw7puKBEhjCzl9oaNjifyjZQisZrVc5AvXhCH3kNsBnR+sTZGeZsmIj9Y+zqSc6
         eOfjgBOIl2nHEyDbkuPkwp93eVcAekLfYbtJKMWPsG+0YN7+2lVwwkdadAnPGGX2HoSA
         eTYYz4OW48qbO/fOcttCOKbaokX+g7ixZ7H6RNgu4dXgELBzY8W/A/V5G/0JNA8DJiSG
         g8JsIgwshbRdSVTv0F0Ddh57ZAStW0IYcrhYcHgqyuHL2RUXLmCJwF6Rvmodif2QK03/
         G+aE7p8lbumAiNlY9EP+o/eIc40ox92YMdwJGlKIB/CrHWWFhT7btNaEfHkAu5j2jRqO
         kMeg==
X-Gm-Message-State: AOAM532KXRUmyIir4XnK6waZ+E+KM9DGNdPENaQPXuTLpJ4La0nA4m9Q
        zBiJ2jFUVGDGl089VWJ9D2zr9Mh4Z8DtU+Y/ba/AMIJlBRiOog==
X-Google-Smtp-Source: ABdhPJzoiP8vkb53TcwcnNYltAkd/i5mNY3iOc6ozDjpmI+Zwa/A+32+zc4Q0zgAuvAdQZdmBPJT0zkSE/tF02Ee+7I=
X-Received: by 2002:a25:d486:: with SMTP id m128mr2073609ybf.214.1607424068476;
 Tue, 08 Dec 2020 02:41:08 -0800 (PST)
MIME-Version: 1.0
References: <20201016115549.31369-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <482d020e-bb1a-cf00-3f05-2bf26694ec16@microchip.com>
In-Reply-To: <482d020e-bb1a-cf00-3f05-2bf26694ec16@microchip.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 8 Dec 2020 10:40:42 +0000
Message-ID: <CA+V-a8tCATgVYkxrzQGWg9GhD=70Hy=O_eESa5mcewt2PpUo7Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: winbond: Add support for w25m512jw
To:     Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc:     "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh R <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tudor,

On Mon, Dec 7, 2020 at 5:27 PM <Tudor.Ambarus@microchip.com> wrote:
>
> Hi, Lad,
>
> On 10/16/20 2:55 PM, Lad Prabhakar wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
> >
> > This chip is (nearly) identical to the Winbond w25m512jv which is
> > already supported by Linux. Compared to the w25m512jv, the 'jw'
> > has a different JEDEC ID.
>
> W25M512JW-IQ (2 x 256M-bit) Serial MCP (Multi Chip Package) Flash memory,
> introduces a new =E2=80=9CSoftware Die Select (C2h)=E2=80=9D instruction,=
 which we don't
> support. I guess you can't access the second die with what we have in
> mainline. Or am I wrong? We'll need to add support for multi-die support
> if we want to add new multi-die flashes.
>
My bad, yes only the first die is accessible.  I'll post a patch
dropping this id.

Cheers,
Prabhakar
