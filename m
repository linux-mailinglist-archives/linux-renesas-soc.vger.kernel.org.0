Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19A1232C623
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Mar 2021 02:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1441998AbhCDA1o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 3 Mar 2021 19:27:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:50964 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346063AbhCCLGj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Mar 2021 06:06:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 37CBD64ED7;
        Wed,  3 Mar 2021 11:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614769455;
        bh=qBcjikzb/uMaAAucmFpDYe6ETsy8v04d/xZE4lmZH8c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lRfpRhBxL1llsZZUHtIpC/29r926UocjYO3DtucB+ubxP+Gns60XyLObW/NdiXVp+
         W4ad3vNdouUYPaRqAxEsJPdxRk8C9U7uQgmv9O+Yl8aUu7VwFcxa1vKdm7JVdeMBbF
         9rI8ZcSPUKEBrQJX3Qfiwe8IqhwXR5kJ8tswF+3AhWqwdTY0RiQ7T75B6YshhfYebL
         5iNcqfUcOrQsskq7r3QDNt7d3ukrE6C6WYoxLg/mFu8sGfGzEUFId9pME6+THch9j9
         A1d0uIjJGjsAyjmJYRUjHF4ej2b+RWj2DzR+Nkr8gJQEV5f3YiGEDXxvtT+jm0Pm6Z
         OhG1Ly2B0IIQA==
Date:   Wed, 3 Mar 2021 12:04:13 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] timekeeping: Allow runtime PM from
 change_clocksource()
Message-ID: <20210303110413.GB3689@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20210211134318.323910-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Content-Disposition: inline
In-Reply-To: <20210211134318.323910-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 02:43:18PM +0100, Niklas S=C3=B6derlund wrote:
> The struct clocksource callbacks enable() and disable() are described as
> a way to allow clock sources to enter a power save mode [1]. But using
> runtime PM from these callbacks triggers a cyclic lockdep warning when
> switching clock source using change_clocksource().
>=20
> This change allows the new clocksource to be enabled() and the old one
> to be disabled() without holding the timekeeper_lock. This solution is
> modeled on timekeeping_resume() and timekeeping_suspend() where the
> struct clocksource resume() and suspend() callbacks are called without
> holding the timekeeper_lock.
>=20
> Triggering and log of the deadlock warning,
>=20
>   # echo e60f0000.timer > /sys/devices/system/clocksource/clocksource0/cu=
rrent_clocksource

=2E..

I had the same issue when running 'clocksource-switch' from the Kernel
selftests with a Renesas Falcon board using a R-Car V3U. This patch
fixed the deadlock warning, so:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmA/bSgACgkQFA3kzBSg
KbZX0g//UsQj/6utoW/xm0s9S26Zm1IfbgHkXBZWfW1o1TNWn62IVw9aGRtYjN13
nItMwUnH6eic/z8L/+2xQwH2ePQ6N9bjueHBJXWCCi+/0WoEjCryiR8z4E2nHyCh
rROZsdAKaa2jWJCvJT0GctbZXkPx3PLQZ5wVx2PSg/+Egj5wZkph7RgWZnm92D/5
w7oG0jLRAKaJjknh16zah0BHGtNsJaWiVnrM5If5CDe5H/WqLCOxp9sH5+MntaGZ
drneQ92RpkcPsFyM6h4XzVUpUy0UU0VvU6h6xyFU4IZQCigvgmsY1SKZIv+zBS9A
VXxi/0K9TKVcxfKs/D+p/NUzVknmtInNVVVYiAG+AuSQrU902rMGgsnhh2wWpIah
yqcVgnfwQBFBPd32tt+vs9eql6WRegCh0ppjOkSKbuXh2ZGq+5wGU6wqozVYIhdf
SNlWAytw64szTqfjyoqZlmrcp1ZBhRHLqFq5Pe0ooCQJKnPPrSHqRo/662p/Beef
g1pEXQq39Mz9ISMer5yULLUA8gC2orN4ZpsZKoGSXypemI/Brxj9NIhnO9A6+xjc
AjZTP3XyGPICFGnUPSgRmQH75aIFVTob2LVLPjb8k5OH4UfXSXfpLOwlttNNlSVs
QLp5t2yF+EKZ+wfCWiyVHHXev8SDt31b9DydHSRllZEMQW8ZxHE=
=Vsny
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
