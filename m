Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A151B30FCF4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Feb 2021 20:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239893AbhBDTeJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Feb 2021 14:34:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:56418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236563AbhBDTeC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Feb 2021 14:34:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 774C164F38;
        Thu,  4 Feb 2021 19:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612467198;
        bh=qtf1pV8DNlFC9elXhMnkT4Ez5c4lIUk64uNS8v3GVVk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lghzVLiJpvWjTuZxwovKMSW8XkU1i4HOGX6tntUmrgfLSsJnpdJQEpUyhWjGpvwCg
         ugTMgInu18AicwH6VXhXwpxzs+t3Rm4MBewF3wRPkpihdQ/R0P5tzSJv5U7ao50wEd
         8VsOF9Ynjq8pCgMpeU1p3ytTIGFb8lWHNpLJLLqR/8qBAnA+bufGpU2Vu1O4SJ3jUz
         TrfJ+Eu2uFIkPML4s7XeDUL8fu+4q2H1igAz7DJMW009sEwzJMa6QOjPOjFJiK+ODt
         CXtlGtC5TSnHo9igDZcB1bMHDqh6DwCSoh+Ik/hkISjlBm++cmbK0fr/RJPwx92ABO
         EuKpbHaKaDNDw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210115095248.2334597-1-geert+renesas@glider.be>
References: <20210115095248.2334597-1-geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.12
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Thu, 04 Feb 2021 11:33:17 -0800
Message-ID: <161246719705.76967.10807491823382635858@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2021-01-15 01:52:48)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e=
5e:
>=20
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v5.12-tag1
>=20
> for you to fetch changes up to c706121386fe8414ac0a0acab37c74aac698c51d:
>=20
>   dt-bindings: clock: renesas: rcar-usb2-clock-sel: Add support for RZ/G2=
 M/N/H (2021-01-12 12:35:13 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
