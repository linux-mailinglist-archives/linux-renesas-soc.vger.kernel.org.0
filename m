Return-Path: <linux-renesas-soc+bounces-457-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C71857FF132
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 15:06:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B95CB20AC7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 14:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D71D3BB56;
	Thu, 30 Nov 2023 14:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D05A0B9
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Nov 2023 06:06:38 -0800 (PST)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1r8hgb-0001aa-DR; Thu, 30 Nov 2023 15:06:37 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Vivek Gautam <vivek.gautam@codeaurora.org>, 
 Dmitry Osipenko <digetx@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <2440edae7ca8534628cdbaf559ded288f2998178.1701276806.git.geert+renesas@glider.be>
References: <2440edae7ca8534628cdbaf559ded288f2998178.1701276806.git.geert+renesas@glider.be>
Subject: Re: [PATCH] reset: Fix crash when freeing non-existent optional
 resets
Message-Id: <170135319678.682649.10186168762521739609.b4-ty@pengutronix.de>
Date: Thu, 30 Nov 2023 15:06:36 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org

On Wed, 29 Nov 2023 17:55:33 +0100, Geert Uytterhoeven wrote:
> When obtaining one or more optional resets, non-existent resets are
> stored as NULL pointers, and all related error and cleanup paths need to
> take this into account.
> 
> Currently only reset_control_put() and reset_control_bulk_put()
> get this right.  All of __reset_control_bulk_get(),
> of_reset_control_array_get(), and reset_control_array_put() lack the
> proper checking, causing NULL pointer dereferences on failure or
> release.
> 
> [...]

Applied to reset/fixes, thanks!

[1/1] reset: Fix crash when freeing non-existent optional resets
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=4a6756f56bcf

regards
Philipp


