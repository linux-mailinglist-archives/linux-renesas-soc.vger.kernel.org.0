Return-Path: <linux-renesas-soc+bounces-24433-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A60D8C4A836
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 02:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2D613AC508
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 01:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08953346796;
	Tue, 11 Nov 2025 01:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L1p/GbjX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F7C2DBF5E;
	Tue, 11 Nov 2025 01:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762823645; cv=none; b=eYUtuoQEP0Y2c540ysiC/+HmvwO9/Y7UTJoT5POZuSQHq1uNji89Kc1ZaSXIvOprap573G3fp4tHrKKpdb29UJmJsfnMXFPhc34pGaVuDeHKHTmtPW6VqQtGvx+vhUFrbyY+EWTk1DsV6NuSwOSejMsQhbZC9Oh1WuDWwhVv7Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762823645; c=relaxed/simple;
	bh=hLfKK5/Ndh+eKDHap1Bdk56Fe5GhqYZjeqm9QLFmsHE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Gl4pvQD5x9CxtJXzb+IPk3DCnVITWqYtdEr5nLKJLMzXz6gHmkze6LX6+wa898FVbIJ6nAWvWlZa2L0ryWq5NRRqnUd9KQAE1Oox/m96hV/+rGVRbY2LuCMCVAKHdYU/56ODZSiFsIZyNXnje4j8wV7lx/nf7TstlPAP43pbCPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L1p/GbjX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA3EC4CEF5;
	Tue, 11 Nov 2025 01:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762823644;
	bh=hLfKK5/Ndh+eKDHap1Bdk56Fe5GhqYZjeqm9QLFmsHE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=L1p/GbjXK46kKAXlv5v0GUaRYzGkUomhPVi7UP1Ty6+MPvQ97I7Ujpw1f/vsCaW3J
	 b6TLQKlSnYX8DmaElmGL0Hn+5lR5Y8gJ13D+d5e1ta724iQCEMApJXcVWARaMeOOKN
	 g4SolZKtnhgYNi3ttqRo/IBtc14o4CgZTG9xeOH46LhLIUhcwt30nII+T11N3Gmg0v
	 xIauajruBBuh95tAqwxQX1kAv9LDmmgmujlx2Hil3O26b7h7HU9u/S0ZK68mA8tXBe
	 jNV1BlxAmbc9ZD5nxkNdw1O5ww9KwPVE3BOX2RG1v7kasBWCVzRJVDHPoamBr70dkX
	 7yK+HO/QpcRMw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1761906750.git.geert+renesas@glider.be>
References: <cover.1761906750.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.19
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Mon, 10 Nov 2025 17:14:02 -0800
Message-ID: <176282364254.11952.2867679653974215283@lazor>
User-Agent: alot/0.11

Quoting Geert Uytterhoeven (2025-10-31 03:43:56)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:
>=20
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.19-tag1
>=20
> for you to fetch changes up to 07525a693a5ff6592668a0fd647153e4b4933cae:
>=20
>   clk: renesas: r9a09g056: Add clock and reset entries for ISP (2025-10-2=
7 12:15:00 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

