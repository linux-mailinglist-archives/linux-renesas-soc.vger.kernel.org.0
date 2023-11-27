Return-Path: <linux-renesas-soc+bounces-272-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5797F9EF4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 12:49:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A35028158D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 11:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B608F1A73E;
	Mon, 27 Nov 2023 11:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71274189
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Nov 2023 03:49:51 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1r7a7I-0004JO-DR; Mon, 27 Nov 2023 12:49:32 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1r7a7F-00BvmU-Mm; Mon, 27 Nov 2023 12:49:29 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1r7a7F-000AZL-1r;
	Mon, 27 Nov 2023 12:49:29 +0100
Message-ID: <0ee99b7af0aa419f1cf0d803217f0871b10e6a00.camel@pengutronix.de>
Subject: Re: [PATCH 1/6] net: ravb: Check return value of
 reset_control_deassert()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Claudiu <claudiu.beznea@tuxon.dev>, s.shtylyov@omp.ru,
 davem@davemloft.net,  edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, richardcochran@gmail.com, 
 yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be, 
 wsa+renesas@sang-engineering.com, robh@kernel.org,
 biju.das.jz@bp.renesas.com,  prabhakar.mahadev-lad.rj@bp.renesas.com,
 mitsuhiro.kimura.kc@renesas.com,  masaru.nagai.vx@renesas.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>
Date: Mon, 27 Nov 2023 12:49:29 +0100
In-Reply-To: <20231127090426.3761729-2-claudiu.beznea.uj@bp.renesas.com>
References: <20231127090426.3761729-1-claudiu.beznea.uj@bp.renesas.com>
	 <20231127090426.3761729-2-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org

On Mo, 2023-11-27 at 11:04 +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> reset_control_deassert() could return an error. Some devices cannot work
> if reset signal de-assert operation fails. To avoid this check the return
> code of reset_control_deassert() in ravb_probe() and take proper action.
>=20
> Fixes: 0d13a1a464a0 ("ravb: Add reset support")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

