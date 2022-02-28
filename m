Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD594C6AA2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Feb 2022 12:36:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235865AbiB1LhC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Feb 2022 06:37:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbiB1LhB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Feb 2022 06:37:01 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 665CD70F77
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Feb 2022 03:36:22 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66D2E478;
        Mon, 28 Feb 2022 12:36:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646048180;
        bh=H3HZ/Mlhc1M1ULfPJ1oa8WfwDCFnUmvds5CzKtz0kt8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ndf681gGulN6r09ZcZaQE+3WIrGTAeWVkAcq7X+XTcoF5mnn4b+jwCzu8EiKfsm4J
         WuoONGGAPn0LaB59Dd6myyDTmHNglOyjjdyZ+yF/LfU8NI7kM7zE28iIDBHOrC336D
         7ko+Wi10dzJLf8qY2lWHNFK1cKefTflBGPS3zS7E=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220228112901.21289-1-laurent.pinchart@ideasonboard.com>
References: <20220228112901.21289-1-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/3] tests: Add SPDX headers to vsp-unit-test-0026.sh
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Mon, 28 Feb 2022 11:36:17 +0000
Message-ID: <164604817788.2091767.6470693310278933011@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2022-02-28 11:28:59)
> vsp-unit-test-0026.sh is missing SPDX headers. Add them.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  tests/vsp-unit-test-0026.sh | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/tests/vsp-unit-test-0026.sh b/tests/vsp-unit-test-0026.sh
> index 0e013cec881b..36ed0b03469b 100755
> --- a/tests/vsp-unit-test-0026.sh
> +++ b/tests/vsp-unit-test-0026.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2020 Renesas Electronics Corporation
> =20
>  #
>  # Test unbinding and binding all VSP1 devices, performing a simple
>=20
> base-commit: 2e98a1bf774bc8516aa8027411a2fd511e52561c
> --=20
> Regards,
>=20
> Laurent Pinchart
>
