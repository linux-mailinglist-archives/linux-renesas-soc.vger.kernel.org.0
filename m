Return-Path: <linux-renesas-soc+bounces-4509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 793F88A0AD0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Apr 2024 10:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19CFF1F254EE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Apr 2024 08:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBC313F455;
	Thu, 11 Apr 2024 08:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FXhNhdVO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EF52EAE5;
	Thu, 11 Apr 2024 08:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712822677; cv=none; b=V0siZiN6OajGNqKEKiE/uaxF4rkAIguZKQ26KwAy/t+MUYECXy7HQ31ydMvNLzHxGIiSBADb88rhzIVSNqqpkynm31LEYQFjujKFxNCgBnDVvAeaB5U6NO32SBm0aIJy7puOCWgzHbCEyiszOZ9vmXdKUb/wNq8BM46/LQfis+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712822677; c=relaxed/simple;
	bh=oAciY08waSan8m81ZhA42W5OhUQqkoxgPW8U0HHUpKA=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=dZr1MWCZWPbsFaGr6dUxlpok8rQD14eQ2Ihes499UmikGjrxCgb/CY8NloaDvAiDWpJ+YFfh06T6p0b0BpYhmed83xydrcFROTblXWK58Vx5W14E68TbUt43z+NqaHmrHBq2Z3uWDXq0vhOrysf+v4djkSlUvaFDaBNpPHSwZ8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FXhNhdVO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90FCAC433F1;
	Thu, 11 Apr 2024 08:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712822677;
	bh=oAciY08waSan8m81ZhA42W5OhUQqkoxgPW8U0HHUpKA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=FXhNhdVOgqCiNGHhB322+hu6QdtEiSvAhCVO77S5qvvs1ZTUGubrG4+gGlXObxwYa
	 4OD8hfCquF+v0PxfD3dUPFZpSTuD3/dGMNOXQMoald2jt+3wfejR9AzTY8R7vh/+24
	 YH9+qaf1j9IPqc4YDuHOpKpKjC9uPa9F4hdjTjDAlFwg4dI62/PFjihsJyLGOxeOOV
	 ZLg/mhgxwWM3JXGLqVjydtIgoPLlhErF7xRpHdWA+uLrhqaZ6kWzR/cSgT7oWW9fZE
	 lnijFVAgB9Z0BzUYUKYZnsRPTAmUVllE82CghGtT2vG8ukUMs0e3HyRHSxZqtDsk8W
	 PU0HbbLlDVB9w==
Message-ID: <c2ff233524cefb21f8f82e9a3117936e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240318110842.41956-2-biju.das.jz@bp.renesas.com>
References: <20240318110842.41956-1-biju.das.jz@bp.renesas.com> <20240318110842.41956-2-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 1/3] clk: Update API documentation related to clock disable
From: Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
To: Biju Das <biju.das.jz@bp.renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 11 Apr 2024 01:04:35 -0700
User-Agent: alot/0.10

Quoting Biju Das (2024-03-18 04:08:40)
>=20
> The API's related to clk disable operation does not explicitly
> states the synchoronous or asynchrous behaviour as it is driver
> dependent. So make this part clear in API documentation.
>=20
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

I'd like Russell's ack on this.

