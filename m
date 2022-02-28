Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46F214C6C7A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Feb 2022 13:29:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236072AbiB1M37 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Feb 2022 07:29:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236042AbiB1M36 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Feb 2022 07:29:58 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D631E3B54C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Feb 2022 04:29:18 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8CCAE478;
        Mon, 28 Feb 2022 13:29:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646051356;
        bh=SEjaXkU4/jUbL3xBPUg/ZS1Kzskh1SWCG9z2ojY9kU8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dK//tFssh+B2hjiYl7F6uC7VLVMLwlzRqvGwSUCteB8BLb1t4kWR3QczGNtzI80iA
         rVllANQ/zhL6erYGn5dJg8z6rX1WmzZwRpkqnBcf8HpZebexTuJnc76JGd182/g6sQ
         4clQH6pUwBPMXXKpL3Mz+eO62CeNK8Auk9mGents=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220228112901.21289-3-laurent.pinchart@ideasonboard.com>
References: <20220228112901.21289-1-laurent.pinchart@ideasonboard.com> <20220228112901.21289-3-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 3/3] tests: Add RPF cropping test for YUV formats
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Mon, 28 Feb 2022 12:29:14 +0000
Message-ID: <164605135487.2091767.11542421263644129120@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2022-02-28 11:29:01)
> YUV formats can be subsampled, which interact with cropping. Add a test
> to verify that the VSP driver handles this correctly.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  tests/vsp-unit-test-0027.sh | 46 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100755 tests/vsp-unit-test-0027.sh
>=20
> diff --git a/tests/vsp-unit-test-0027.sh b/tests/vsp-unit-test-0027.sh
> new file mode 100755
> index 000000000000..8be8ae736375
> --- /dev/null
> +++ b/tests/vsp-unit-test-0027.sh
> @@ -0,0 +1,46 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2017-2022 Renesas Electronics Corporation
> +
> +#
> +# Test RPF crop using multiplanar YUV formats, test buffer offset calcul=
ation
> +# with subsampling. Use a RPF -> WPF pipeline, passing a selection of cr=
opping
> +# windows.
> +#
> +
> +. ./vsp-lib.sh
> +
> +features=3D"rpf.0 wpf.0"
> +crops=3D"(0,0)/512x384 (32,32)/512x384 (32,64)/512x384 (64,32)/512x384"

I was expecting to see more strenuous variations here. Are the crops
limited for now ? Does this already highlight any failures in the
driver? or do these pass?

Anyway, Extending the tests is beneficial, even if this can be further
extended.


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> +formats=3D"NV12M NV16M YUV420M YUV422M YUV444M"
> +
> +test_rpf_cropping() {
> +       local format=3D$1
> +       local crop=3D$2
> +
> +       test_start "RPF crop from $crop in $format"
> +
> +       pipe_configure rpf-wpf 0 0
> +       format_configure rpf-wpf 0 0 $format 1024x768 YUV444M --rpfcrop=
=3D$crop
> +
> +       vsp_runner rpf.0 &
> +       vsp_runner wpf.0
> +
> +       local result=3D$(compare_frames crop=3D${crop})
> +
> +       test_complete $result
> +}
> +
> +test_main() {
> +       local crop
> +       local format
> +
> +       for format in $formats ; do
> +               for crop in $crops ; do
> +                       test_rpf_cropping $format $crop
> +               done
> +       done
> +}
> +
> +test_init $0 "$features"
> +test_run
> --=20
> Regards,
>=20
> Laurent Pinchart
>
