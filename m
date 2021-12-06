Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3DE8469F5F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Dec 2021 16:44:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359360AbhLFPrR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 10:47:17 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:55976 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389555AbhLFPkd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 10:40:33 -0500
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C169EE;
        Mon,  6 Dec 2021 16:37:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638805022;
        bh=D56lLRSArY1yZEqn5UzHN7KQ17j7Zx/KUEelXTFST4c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DqOENKAYqqR0MuNItitMj3SHFH10Llyk4x6FPG39I48osyLouoEbOW+ecj/lDp9bL
         IWp/9TDlcqDU3O2e8JDhL8K2hMTPrzpzXga2T5/S19wtIeUw5polWm3jZqxqZJpi1f
         XMlae0W23/AM6yrwGape6t7Oxq3X9Hy6nGlBVuJQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211206140601.18912-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20211206140601.18912-1-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: dsi: Fix hsfreq range matching
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Date:   Mon, 06 Dec 2021 15:36:59 +0000
Message-ID: <163880501967.995700.15407363888149324944@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2021-12-06 14:06:01)
> When iterating over hsfreqrange_table, rcar_mipi_dsi_parameters_calc()
> may dereference the sentinel table entry. Fix the loop condition to
> break as soon as a suitable entry is found, defined by the lower bound
> of the frequency range stored in the table being equal to or higher than
> the target frequency.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
> I will squash this with "drm: rcar-du: Add R-Car DSI driver", but I'm
> posting it separately to ease review.
> ---
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rc=
ar-du/rcar_mipi_dsi.c
> index faf993eae564..891bb956fd61 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> @@ -219,9 +219,8 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar=
_mipi_dsi *dsi,
>         /* Find hsfreqrange */
>         hsfreq =3D fout_target * 2;
>         for (i =3D 0; i < ARRAY_SIZE(hsfreqrange_table); i++) {
> -               if (hsfreq > hsfreqrange_table[i][0] &&
> -                       hsfreq <=3D hsfreqrange_table[i+1][0]) {
> -                       setup_info->hsfreqrange =3D hsfreqrange_table[i+1=
][1];
> +               if (hsfreqrange_table[i][0] >=3D hsfreq) {

It's hard to tell from this patch, or this point alone, but I see that
fout_target is already limited at 1250000000, so hsfreq can never be
bigger than 2500000000U.

So ... this is fine (as long as the table and validation check are kept
in sync if anyone updates this).

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Also validated that it still boots/probes and displays pictures with
kmstest and kmstest --flip.

--
Kieran


> +                       setup_info->hsfreqrange =3D hsfreqrange_table[i][=
1];
>                         break;
>                 }
>         }
>=20
> base-commit: c18c8891111bb5e014e144716044991112f16833
> prerequisite-patch-id: dc9121a1b85ea05bf3eae2b0ac2168d47101ee87
> prerequisite-patch-id: 6754b2ec4caec03e235550004003fe63c1cc793b
> prerequisite-patch-id: d69c605df34d40934fa5d4e00f23d5785105099d
> prerequisite-patch-id: 7d9edfb4758cafe8aec92d32709c0ad25a50942c
> prerequisite-patch-id: 86c526fb41f9f9cbe95c50ba8a140e20484f187f
> prerequisite-patch-id: a9649b53b55858f023b8d3d29afb9be7ad39ea3b
> --=20
> Regards,
>=20
> Laurent Pinchart
>
