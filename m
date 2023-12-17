Return-Path: <linux-renesas-soc+bounces-1175-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC01C8163A0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Dec 2023 00:58:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C44E1F21191
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Dec 2023 23:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47724B12C;
	Sun, 17 Dec 2023 23:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RbMz7D6g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882EB4AF92;
	Sun, 17 Dec 2023 23:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2312C433C7;
	Sun, 17 Dec 2023 23:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702857477;
	bh=WSrZgVvrBYRN1MTIOcsOsvyFcTrJl9GKheA2x3asG3I=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=RbMz7D6ghbPgagJQOigQYABaChbZmkuvlI+M8zCR6CQn0e0zUo2Vi72C+KTPGa52E
	 bzGN2VuI6ONRZrdxwmD9ozpygfIOj7J5BrISM91fs91wCLnjDvOTk/MP1Mkb+X0l3R
	 wMn4xIztlzLcjnXbWm2/iTCjkZ0w2sly06nz42BeBaAqHWQ0F/9Cr79LM2qjkL+hcI
	 K7oKaMWWOYipHfFDdfOSt/RJy99Gpq6QKk3XFfQNAk554SUpJkhwu7UC5XkRUOEH/o
	 hvkF20U3+jGX5v6Hw7mvrNrf4pmNEL8q/dFBU77VHfteJt59iDVYDcm/DnaRS38zyr
	 ScljgVm9+nDZw==
Message-ID: <c13716f6b400c69270a707508a22fedd.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231122142310.203169-4-biju.das.jz@bp.renesas.com>
References: <20231122142310.203169-1-biju.das.jz@bp.renesas.com> <20231122142310.203169-4-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 3/5] clk: versaclock3: Use u8 return type for get_parent() callback
From: Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
To: Biju Das <biju.das.jz@bp.renesas.com>, Michael Turquette <mturquette@baylibre.com>
Date: Sun, 17 Dec 2023 15:57:54 -0800
User-Agent: alot/0.10

Quoting Biju Das (2023-11-22 06:23:08)
> The return type of get_parent() member in struct clk_ops is u8.
> Use same return type for corresponding callback function as well.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Applied to clk-next

