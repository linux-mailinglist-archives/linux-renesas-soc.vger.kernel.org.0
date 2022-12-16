Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D836C64EE07
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Dec 2022 16:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231305AbiLPPiZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Dec 2022 10:38:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231287AbiLPPiY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Dec 2022 10:38:24 -0500
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E840750D6A
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Dec 2022 07:38:23 -0800 (PST)
Received: by mail-vk1-xa2e.google.com with SMTP id z23so1282559vkb.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Dec 2022 07:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NwVYTWrBEe8tWrYjcfnvWqHWxzfV03Ve5YW/FymtnO4=;
        b=cnKZrhN1b1eD4UE0ZjU3GzKlt2reyE/tmJSzgu7/DDNIaTzcANIDvFt1GdyBhO9I1w
         d+JMLXFdGIKB2Y6K4b8mAZhbqTPYXYfX1vLZ9xelMKmQ0GhBqgdE1Dsg0Ews1pFX4B7c
         rrIYAcUl1Yc/uQOCb4T2uRIkZxDKQehX7jy6zd67EiuU8jHM7UAM266Xlbi1gwUWBPvf
         S0uJRo/NlbcIJaJECjMEYEkk6ezna7++4kFY9Nj1goky7mLzKHX9wgqo+PlWWQ0UEPC6
         onnIiWMVfoqJga9kxkLhHpMyjMt+Hv7OmkavDOF/Usy8sz/2F9CoWm63xkLoGcks0OsW
         Emog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwVYTWrBEe8tWrYjcfnvWqHWxzfV03Ve5YW/FymtnO4=;
        b=RyWC23u9WNOzgF6iSDnD20TLr+J9gOdwDWs/XfwACtvu+Jw1ODxyIa/uq5Zah7ffWE
         gOtBdh4VHcS+ibAPWZtnGo049r9d0y2kC/wrkpoVkxDxuwJZdIyf/el6AsrlGdLFs8at
         m0YpZYT6nsJ/SztG0Id9eKm1f3L4IVQ5q72aUQ8mie8boiPBETSvqM3z//x3pqRajGC8
         bYn6dBIqKKOFtA8qQu9qiHKfpvxck731NO107o14PD9OxfrT9NB3+ftWDT04CJFGMTCq
         6B/UdeEHdFJUKW61YKZO90BuZR1Q8xkkaa723CEh3EqezemRvPShEcjQ18YZg05/cxD8
         yEJQ==
X-Gm-Message-State: ANoB5pmGLxUqGXlH9nOuDsbDQ5DZ5YfeVZgIpz9D6HgXzIi3xyA9ERYC
        +yp+qh8UcBRbmbznpzforTGxXRi852tM4vbp
X-Google-Smtp-Source: AA0mqf6trNef7iI2srPKNfAQaH0g5YlD0yxZ/ek+n1fNZCfTJ/CeI+hhs0SqwT5z1vySizQuPBHtzA==
X-Received: by 2002:a1f:ad93:0:b0:3bc:b0f5:a4e5 with SMTP id w141-20020a1fad93000000b003bcb0f5a4e5mr20355647vke.8.1671205102951;
        Fri, 16 Dec 2022 07:38:22 -0800 (PST)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id t26-20020a05620a035a00b006b949afa980sm1609916qkm.56.2022.12.16.07.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 07:38:22 -0800 (PST)
Date:   Fri, 16 Dec 2022 10:38:19 -0500
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     linux-iio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v9 3/5] Documentation: ABI: sysfs-bus-counter: add
 cascade_counts_enable and external_input_phase_clock_select
Message-ID: <Y5yQ6068MbuLocE0@fedora>
References: <20221214103136.2493474-1-biju.das.jz@bp.renesas.com>
 <20221214103136.2493474-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RPzjAyEWYzhT0iZF"
Content-Disposition: inline
In-Reply-To: <20221214103136.2493474-4-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--RPzjAyEWYzhT0iZF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 14, 2022 at 10:31:34AM +0000, Biju Das wrote:
> This commit adds cascade_counts_enable and external_input_phase_
> clock_select items to counter ABI file.
> (e.g. for Renesas MTU3 hardware used for phase counting).
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: William Breathitt Gray <william.gray@linaro.org>

> ---
> v8->v9:
>  * Added available blocks for external_input_phase_clock_select_available
>  * Removed the "This attribute" from the external_input_phase_clock_select
>    description, and capitalize the word "counter" from description.
>  * Removed the "This attribute" from the cascade_counts_enable descriptio=
n,
>    and capitalize "counts" and "counter"
>  * Moved these device-level configuration blocks to top of the file.
> v7->v8:
>  * Replaced cascade_enable->cascade_counts_enable
>  * Updated commit header and description
>  * Added external_input_phase_clock_select_available entry for driver-
>    specific enum attribute and created a new entry block for it.
>  * Add a line stating cascade_counts_enable is a boolean attribute.
>  * Added missing 'component_id' suffix.
> v6->v7:
>  * Replaced long_word_access_ctrl_mode->cascade_enable
>  * Updated Kernel version
> v5->v6:
>  * No change
> v5:
>  * New patch
> ---
>  Documentation/ABI/testing/sysfs-bus-counter | 32 +++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/Documentation/ABI/testing/sysfs-bus-counter b/Documentation/=
ABI/testing/sysfs-bus-counter
> index ff83320b4255..97c1bd7a5df2 100644
> --- a/Documentation/ABI/testing/sysfs-bus-counter
> +++ b/Documentation/ABI/testing/sysfs-bus-counter
> @@ -1,3 +1,33 @@
> +What:		/sys/bus/counter/devices/counterX/cascade_counts_enable
> +KernelVersion:	6.3
> +Contact:	linux-iio@vger.kernel.org
> +Description:
> +		Indicates the cascading of Counts on Counter X.
> +
> +		Valid attribute values are boolean.
> +
> +What:		/sys/bus/counter/devices/counterX/external_input_phase_clock_sele=
ct
> +KernelVersion:	6.3
> +Contact:	linux-iio@vger.kernel.org
> +Description:
> +		Selects the external clock pin for phase counting mode of
> +		Counter X.
> +
> +		MTCLKA-MTCLKB:
> +			MTCLKA and MTCLKB pins are selected for the external
> +			phase clock.
> +
> +		MTCLKC-MTCLKD:
> +			MTCLKC and MTCLKD pins are selected for the external
> +			phase clock.
> +
> +What:		/sys/bus/counter/devices/counterX/external_input_phase_clock_sele=
ct_available
> +KernelVersion:  6.3
> +Contact:        linux-iio@vger.kernel.org
> +Description:
> +                Discrete set of available values for the respective devi=
ce
> +                configuration are listed in this file.
> +
>  What:		/sys/bus/counter/devices/counterX/countY/count
>  KernelVersion:	5.2
>  Contact:	linux-iio@vger.kernel.org
> @@ -215,6 +245,8 @@ Contact:	linux-iio@vger.kernel.org
>  Description:
>  		This attribute indicates the number of overflows of count Y.
> =20
> +What:		/sys/bus/counter/devices/counterX/cascade_counts_enable_component=
_id
> +What:		/sys/bus/counter/devices/counterX/external_input_phase_clock_sele=
ct_component_id
>  What:		/sys/bus/counter/devices/counterX/countY/capture_component_id
>  What:		/sys/bus/counter/devices/counterX/countY/ceiling_component_id
>  What:		/sys/bus/counter/devices/counterX/countY/floor_component_id
> --=20
> 2.25.1
>=20

--RPzjAyEWYzhT0iZF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCY5yQ6wAKCRC1SFbKvhIj
K6wwAQC35HyxgGFIZuO6DPj/58SRNvtCfd+bm3XFMvIeZgXBBgEAkGREoVUuwegk
B5TmHO0kInDtMswvQ+Oz1Sn25oNf0wg=
=xoub
-----END PGP SIGNATURE-----

--RPzjAyEWYzhT0iZF--
