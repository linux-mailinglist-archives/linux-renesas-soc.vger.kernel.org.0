Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33EB05604D8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 17:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbiF2Pol (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 11:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233095AbiF2Pol (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 11:44:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A87C26560
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 08:44:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CFE33D7;
        Wed, 29 Jun 2022 17:44:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656517479;
        bh=V+gRbJt9BC+ZCvPlfnCJGNX6Ml2YMQNpr1/fzSvq1ng=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sGgX43S7JkWwITmH8z3YcIQXXHBdxNZINA2+ka3Freq6ELJ+tUGQ8vyZKFhZUcfBn
         gorQFeM9a5GSUnQdIsKbgu35P8QuVoE2n990vVFxeYKp6PYLuwhfnrhKNYWqyyVzBR
         QXmVa60zjwuwgrysrxPUI1+mtycze0W7A8zv1xAY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220609234031.14803-11-laurent.pinchart@ideasonboard.com>
References: <20220609234031.14803-1-laurent.pinchart@ideasonboard.com> <20220609234031.14803-11-laurent.pinchart@ideasonboard.com>
Subject: Re: [kms-test] [PATCH 10/10] tests: Rename kms-test-planeposition.py to kms-test-plane-position.py
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Wed, 29 Jun 2022 16:44:36 +0100
Message-ID: <165651747648.2049236.7319381710928942634@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2022-06-10 00:40:31)
> Match the name scheme of other tests by renaming
> kms-test-planeposition.py to kms-test-plane-position.py.
>=20

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  tests/{kms-test-planeposition.py =3D> kms-test-plane-position.py} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename tests/{kms-test-planeposition.py =3D> kms-test-plane-position.py}=
 (100%)
>=20
> diff --git a/tests/kms-test-planeposition.py b/tests/kms-test-plane-posit=
ion.py
> similarity index 100%
> rename from tests/kms-test-planeposition.py
> rename to tests/kms-test-plane-position.py
> --=20
> Regards,
>=20
> Laurent Pinchart
>
