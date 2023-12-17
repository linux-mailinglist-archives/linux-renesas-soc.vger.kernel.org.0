Return-Path: <linux-renesas-soc+bounces-1177-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF048163A5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Dec 2023 00:58:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFB691F212D1
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Dec 2023 23:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2041A4B130;
	Sun, 17 Dec 2023 23:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/1GJ011"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CC44B126;
	Sun, 17 Dec 2023 23:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7869FC433C8;
	Sun, 17 Dec 2023 23:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702857497;
	bh=5VlEOEupIPP9cPamqnIfnoKLJJQLs2bq7SHRRUU355M=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=j/1GJ011ivzrhI6fbo6pJ3OG97a3ookyxxKr0xPAR6/Tv8hq/vTt001iB1n+Vaosh
	 exFLEb6dGqEZREMnTbUNnbzw5xm20Tp3hM5bBVT1OfW2y/k85ByJa0TXqebo9c0VMQ
	 FqlrRlAUH6eY3Qvf4uiKq/s3fvX+dmX1syK/Qswn1Tc8Rr0R3ToXq2ME9UZzjaXSAt
	 4uDZ5eX2jtFG6YIG4/IOz0Hp2ypztuHHlkhdZdGvC11utHF0dCUhtgHscct8/fzYbT
	 D18Cfr4pxEmqSNjP+jhPHCBBXYCdociCyGEF+7IikaJsgG3RtKtpzdVriMA0ksgswD
	 LgJ3iz/ZzuxHg==
Message-ID: <5db2f8755a4c75fc0495d5b208dca9be.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231122142310.203169-2-biju.das.jz@bp.renesas.com>
References: <20231122142310.203169-1-biju.das.jz@bp.renesas.com> <20231122142310.203169-2-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 1/5] clk: versaclock3: Update vc3_get_div() to avoid divide by zero
From: Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
To: Biju Das <biju.das.jz@bp.renesas.com>, Michael Turquette <mturquette@baylibre.com>
Date: Sun, 17 Dec 2023 15:58:15 -0800
User-Agent: alot/0.10

Quoting Biju Das (2023-11-22 06:23:06)
> Update vc3_get_div() to avoid divide by zero operation on
> vc3_div_round_rate() by returning1, if there is no table match
> found.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Applied to clk-next

