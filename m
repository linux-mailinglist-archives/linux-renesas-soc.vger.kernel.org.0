Return-Path: <linux-renesas-soc+bounces-7708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A787946645
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Aug 2024 01:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1A511F21F29
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2024 23:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8870613AA47;
	Fri,  2 Aug 2024 23:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rv/qJOuX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEE51ABEB5;
	Fri,  2 Aug 2024 23:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722642853; cv=none; b=XwxEIWWPqX4ihJxbEbRo0z045w6he0pyhzfHECcxhvxVtfiuKZx24pDbPdY1DUy6GFdsPCLiVjCDdThxJ9g9P0KkHKN/JUqdqIMcqwcCHal170mtAwYi3q4otwF136k5hqaNNbUxonu7wGBZ1UV13yMTKIe9CerKGgydId01us4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722642853; c=relaxed/simple;
	bh=rZWiK/1Iv5H1CIZJmuDlsAC2QQMACq9GkygNZXvWqao=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Hfd/lknI+modIiDsSVCDafqcDp1pXSoEn1QcjcskWXK0Cnqk+K2aH+tl0cIgVasVL/uLVoj6eJY2jPnLtbxo1gTNy+T+ZAoBL/jKthR+eePhBs0UDTiQ95CfPxkket9vPmoUHY246IX7HXoC2VbvbEMTZCEPZVW09v+x8dRuObQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rv/qJOuX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 257CFC32782;
	Fri,  2 Aug 2024 23:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722642853;
	bh=rZWiK/1Iv5H1CIZJmuDlsAC2QQMACq9GkygNZXvWqao=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Rv/qJOuXnUmTm3eWwR0mynFUfyKHUZXHklIB5sIbTpbhPx85sDI2RZ0S45FMHcCv2
	 SFoHo245sL8r+yleuZ+FP/+Ia1mJQgMs7niUVrbBU+vR0gIDF3Vt/Gj0Ou+r5ESn9p
	 hsnxDJEekaT0rey6uR0I2S23JdiAs7cbh4hSq3fHlLRclxAzH/PzLOcLlqSUfZU9fe
	 pZgEm0dpxU6R8O3cfsnQI6n/0utv0xtyYPj4a6T4MH8Ffpo2cORe7AWiERkJtWkcTc
	 KNQkcpWmGDOLsWWAj03kkWd4Z7RL9MBbVQtOcmCCSZcM0z9OZ6IjbrmLXBzLQI/i0V
	 10brQgMOqnl+g==
Message-ID: <a36c4e33120c47127a6dfbe007414a84.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240731191312.1710417-4-robh@kernel.org>
References: <20240731191312.1710417-4-robh@kernel.org>
Subject: Re: [PATCH] clk: Use of_property_present()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring (Arm) <robh@kernel.org>
Date: Fri, 02 Aug 2024 16:54:11 -0700
User-Agent: alot/0.10

Quoting Rob Herring (Arm) (2024-07-31 12:12:42)
> Use of_property_present() to test for property presence rather than
> of_(find|get)_property(). This is part of a larger effort to remove
> callers of of_find_property() and similar functions.
> of_(find|get)_property() leak the DT struct property and data pointers
> which is a problem for dynamically allocated nodes which may be freed.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next

