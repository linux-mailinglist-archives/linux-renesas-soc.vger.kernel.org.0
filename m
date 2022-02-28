Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDBF44C6BE0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Feb 2022 13:11:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235076AbiB1MMK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Feb 2022 07:12:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233197AbiB1MMJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Feb 2022 07:12:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D93E763BFB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Feb 2022 04:11:30 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24D0B478;
        Mon, 28 Feb 2022 13:11:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646050289;
        bh=wc5qM2DpZwoP/+bXRDLD6LF5cgpgELANjo0Ovq/VvJg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=B6u8Lyo/JAiS9mvzzcMv8LY3KMl/s5OKA5C8EaD3ICivuwJXO/qJVZN7xqk827Uuv
         pl1DM+vELhY/uCbkpdFgsddBbD4fSZZiSm0fz2ZmqvgiPmK9MFsmYF9KXclg81/0kM
         XnX2HUmJWcl2fBafJCK5kEWLuiqdVbdMzNzPkUxE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220228112901.21289-2-laurent.pinchart@ideasonboard.com>
References: <20220228112901.21289-1-laurent.pinchart@ideasonboard.com> <20220228112901.21289-2-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/3] gen-image: Crop input image before format conversion to YUV
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Mon, 28 Feb 2022 12:11:26 +0000
Message-ID: <164605028669.2091767.828878744851316530@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2022-02-28 11:29:00)
> When converting the input image to a subsampled YUV format, chroma
> components are averaged horizontally to emulate the VSP internal
> conversion to YUV444. If the image is subsequently cropped to emulate
> the RPF cropping, the edge chroma values end up effectively taking into
> account pixels outside of the crop rectangle. This doesn't match the
> hardware mode of operation which crops the image when reading it through
> DMA, before performing any other operation.
>=20
> Fix this by cropping the image just after reading it, before format
> conversion.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Seems fine. And there's only one input format so:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  src/gen-image.c | 33 +++++++++++++++++----------------
>  1 file changed, 17 insertions(+), 16 deletions(-)
>=20
> diff --git a/src/gen-image.c b/src/gen-image.c
> index d9f92253af46..170d69490399 100644
> --- a/src/gen-image.c
> +++ b/src/gen-image.c
> @@ -1531,6 +1531,23 @@ static int process(const struct options *options)
>                 goto done;
>         }
> =20
> +       /* Crop */
> +       if (options->crop) {
> +               struct image *cropped;
> +
> +               cropped =3D image_new(format_by_name("RGB24"),
> +                                   options->inputcrop.width,
> +                                   options->inputcrop.height);
> +               if (!cropped) {
> +                       ret =3D -ENOMEM;
> +                       goto done;
> +               }
> +
> +               image_crop(input, cropped, &options->inputcrop);
> +               image_delete(input);
> +               input =3D cropped;
> +       }
> +
>         /* Convert colorspace */
>         if (options->input_format->type =3D=3D FORMAT_YUV) {
>                 struct image *yuv;
> @@ -1561,22 +1578,6 @@ static int process(const struct options *options)
>                 input =3D rgb;
>         }
> =20
> -       /* Crop */
> -       if (options->crop) {
> -               struct image *cropped;
> -
> -               cropped =3D image_new(input->format, options->inputcrop.w=
idth,
> -                               options->inputcrop.height);
> -               if (!cropped) {
> -                       ret =3D -ENOMEM;
> -                       goto done;
> -               }
> -
> -               image_crop(input, cropped, &options->inputcrop);
> -               image_delete(input);
> -               input =3D cropped;
> -       }
> -
>         /* Scale */
>         if (options->output_width && options->output_height) {
>                 output_width =3D options->output_width;
> --=20
> Regards,
>=20
> Laurent Pinchart
>
