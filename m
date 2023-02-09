Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8289690E59
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Feb 2023 17:30:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjBIQaz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Feb 2023 11:30:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjBIQay (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 11:30:54 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8520C2ED5A
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Feb 2023 08:30:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3920AB82224
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Feb 2023 16:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A35C433D2;
        Thu,  9 Feb 2023 16:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675960250;
        bh=Efm74hCax7nbL9eCglLZObLpMtWIWpJm+nR1NX3jWlc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pfMV55tqr/8fEbQEOSG9pkO9BQueYUPaeL0YgIDyJHJhaT2v8FjHjmN5qsUBqfOeR
         bK0d74po3UOkZ3rOUcjiUxixqBuGuM5w3es9mqbk/Tkzw+10p+FIAmM3H1LCiTc+pd
         hF+SnJUfjHG2nMeQHlZgYKOB14GTAj6YtO6LHB1Jnpn1LHWvv8sOwkSy0dYP0Dr09m
         RZJwZFEroVT/J8vmQ5qXSUdLFW6bvBs/AUdz/KC0PvBzkjZkHPgCItl/IxEXdp+tNH
         QwRydHD0vZXuPZEYU5N6N3biL5wbvobmgkvUW94wTTtsIUEP1HyoKLiRov7DhNF4yG
         QP0I1X4J+UCBA==
Date:   Thu, 9 Feb 2023 17:30:48 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g0: Add thermal nodes
Message-ID: <Y+UfuIN59JeLC2Jt@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <b92a1a28afb9f75f24f0137af9f77e95d7ebaec3.1675959327.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HiOmkCSWE+nhAHbF"
Content-Disposition: inline
In-Reply-To: <b92a1a28afb9f75f24f0137af9f77e95d7ebaec3.1675959327.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--HiOmkCSWE+nhAHbF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 09, 2023 at 05:23:30PM +0100, Geert Uytterhoeven wrote:
> Add device nodes for the Thermal Sensor/Chip Internal Voltage
> Monitor/Core Voltage Monitor (THS/CIVM/CVM) and the various thermal
> zones on the Renesas R-Car V4H (R8A779G0) SoC.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--HiOmkCSWE+nhAHbF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPlH7cACgkQFA3kzBSg
KbZfgBAAkebkIQa4E1ly2wIRHZfYmpTeQqYDEs0/IFmeCcfwxiaMiMOgxJ0DK+ej
Uat4eostF8yJ58wXHj294hVv2BS9VHV8zKWJwETtrIhSK3WoRQjAV4sgNIQFQPMo
qykklZmfRonQ+Zz7/w+Af7LKDvK6/FaAt+5tjpvwhj04Zb15q5CiTZLq3XLlM86h
nf97r+YXSpotl97L+v0Gn9EvOKHvcCT6ALZp/sre1zdy6AFlRbiHIbUJaLTZUr1F
PQr4J78zEKR5WVL04dmJHQI0EZYW7tKdd5a1ffj/PMjl+laJVTKR4tJWNJ4Ce2Mg
XccXEhe9VAD/jkR4KxX1M9czIoAU1yEJJxaeV/ZNUEDXwNuQlDs1bTzbjDcBSNgT
YHrsuvINhC7eiO5SfgcwcXhw66LMuRF9uurLdIJudhloaq0joIhMn9HPTzRVhmOo
V+V48XNnARYXCzQGuNAxhmFNww6aBLY4QH0uXjXNPXu3KK+o4KqTx/wn01JSGc1x
C6lgydXJfIJZxuPCuUlujg5DwtADPQYQHp/0zs4dSr4ytIiCQDbD4cmO0YOaSfzd
CyQrrBjnAQLPkv/Vv0YSjL2Txi7Um8ZJ3kbFP/ToOFHOjDZOTXoRxGA7vot2ty1y
4UEszVsp6d++Nt5J+Xj2YssoDNU/QtyjAjaZON+3OtdsVpm/fRI=
=0edo
-----END PGP SIGNATURE-----

--HiOmkCSWE+nhAHbF--
