Return-Path: <linux-renesas-soc+bounces-1169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9A6816360
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Dec 2023 00:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2C511C20DBF
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Dec 2023 23:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ECEB4B151;
	Sun, 17 Dec 2023 23:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXN8jbSk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9204B149;
	Sun, 17 Dec 2023 23:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A7CBC433C8;
	Sun, 17 Dec 2023 23:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702855714;
	bh=o762Vn71InS3ldpVTuMXk7OnTk9GH3mujp4C8PSB40w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KXN8jbSkyZps0+HneoAgdSga6MHU47qoAyorzLqlB2DN4xL/tK6YMjqRlKb42bkpL
	 rlyACzfTBB+oS8QyfA7BgtiFswR7nGiDuSYqBAbUBeI4QDpJW28ssle0pOcAwFOwYp
	 bRZrKvJyrUdOexXSE2g1SZGW47ISUpHmYKdJUUnItDdDUyJVuRDTEU9FcutpSJP/Lr
	 wBXCVg7gi68zaH/31m0Sl1xSpp8r9Ae3XBmJci17+q9sZXHmkovmR3hCDodudVxJM+
	 +P0ffkkZLwnr9NEHkbfoVGIgHIs5R3FYfCuYQT+o4Jq1iDJn8wHAyO0NwMg2E9C5o/
	 QB22hKsRDh1qA==
Message-ID: <e825dc2a04ff76571903102e41f4c1c9.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231113221949.111964-1-marek.vasut+renesas@mailbox.org>
References: <20231113221949.111964-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: clk: rs9: Add 9FGV0841
From: Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, Alexander Stein <alexander.stein@ew.tq-group.com>, Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-clk@vger.kernel.org
Date: Sun, 17 Dec 2023 15:28:31 -0800
User-Agent: alot/0.10

Quoting Marek Vasut (2023-11-13 14:18:51)
> This is an 8-channel variant of 9FGV series.
>=20
> Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---

Applied to clk-next

