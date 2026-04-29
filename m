Return-Path: <linux-renesas-soc+bounces-31739-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6D0wJ3iA8WlYhQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31739-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 05:52:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5907048ED45
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 05:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 440CA309F1ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 03:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C6D396D0A;
	Wed, 29 Apr 2026 03:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7i+osfd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7753A393DD8;
	Wed, 29 Apr 2026 03:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434432; cv=none; b=TlSvTBliDO98wa3O7EgxzZkI2o9dU+wpBcS8LfqfXPTsAF76FP2fLG2OHbXuw8oqmja+eOJTkw06yKdlA48QmOMzjjFk1Q7NTozMO/eLozwBLAKlaQO5tfmQeO2/jdipboXc/ISDLJCPAoG6/tI1HocLmeXEAfr8iPE9bGwG33E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434432; c=relaxed/simple;
	bh=kmlYhPPO7si0Y03tGLFg/g4545mtNj4YJC/GOASuHs8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=gSXrUGxooi1vm/M7dj9qS3MolOrc0RqRRCo8HyvuiGblgwoItt2obMMf058qOv0T3bHo5Y0rfPzPjIipE9DGGurMG9YdxX7Q/0TjGCv1uVn1Ez6/pErrYgGpE+yZOe//gf9KlGlx8pmsJVb5VONuF7I2KzShsxnZuLYF6Umao5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7i+osfd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 036F4C2BCB4;
	Wed, 29 Apr 2026 03:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434432;
	bh=kmlYhPPO7si0Y03tGLFg/g4545mtNj4YJC/GOASuHs8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Z7i+osfdORJpLv7U6encAiWyXyx6atxjZPWZVVbqE2/pL83dB8+zxlHAfglmmEiFw
	 zGSJX/ihv8yAC+/otyArnUyZRppIPrjwD3iBv7NuzZIxAvd1lJMpm8z5nOAgO8ZQuN
	 eCtxgFCbgjutDuN+OeIsZ6Z/zkBVWZS6+K9rnXJqDwtMyJcmawuuMJxxVisZKmA+s2
	 lUHDG90TeAgWyK7aPoAINvcsDaTLjAsJb9qGEdadMzkeP5eDAj3JVkTff6zoAbrAmC
	 bJ1Bi6rOQtTqptfN6MrH3a2rrWATqrg1Hmwm3aB3LDBJ8rPd3tJ7p3vWsT/1H7Au+P
	 JJ1j3PTYt7Sew==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-1-c48ef5a3100a@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com> <20260309-clk-det-rate-fw-managed-v2-1-c48ef5a3100a@redhat.com>
Subject: Re: [PATCH v2 01/12] clk: add new flag CLK_ROUNDING_NOOP
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>, Sudeep Holla <sudeep.holla@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Andrea della Porta <andrea.porta@suse.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Bjorn Andersson <andersson@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>, Cristian Marussi <cristian.marussi@arm.com>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, Pengutronix Ker
 nel Team <kernel@pengutronix.de>
To: Brian Masney <bmasney@redhat.com>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 28 Apr 2026 19:15:36 -0700
Message-ID: <177742893645.5403.3938693995862346406@localhost.localdomain>
User-Agent: alot/0.12
X-Rspamd-Queue-Id: 5907048ED45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:subspace.kernel.org:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31739-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.963];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[kernel.org:s=k20201202];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,redhat.com,kernel.org,suse.com,linux.alibaba.com,samsung.com,nxp.com,glider.be,gmail.com,pengutronix.de,linaro.org,arm.com,lists.linux.dev,lists.infradead.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[kernel.org:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Quoting Brian Masney (2026-03-09 07:38:40)
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index fd418dc988b1c60c49e3ac9c0c44aa132dd5da28..1187e5b1dbc123d2d2c1f4369=
0d7dcf75a7c4ac3 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1673,7 +1690,7 @@ EXPORT_SYMBOL_GPL(clk_hw_forward_rate_request);
> =20
>  static bool clk_core_can_round(struct clk_core * const core)
>  {
> -       return core->ops->determine_rate;
> +       return core->ops->determine_rate || clk_is_rounding_noop(core);
>  }
> =20
>  static int clk_core_round_rate_nolock(struct clk_core *core,
> @@ -3528,6 +3545,7 @@ static const struct {
>         ENTRY(CLK_IS_CRITICAL),
>         ENTRY(CLK_OPS_PARENT_ENABLE),
>         ENTRY(CLK_DUTY_CYCLE_PARENT),
> +       ENTRY(CLK_ROUNDING_NOOP),
>  #undef ENTRY
>  };
> =20
> @@ -3906,13 +3924,19 @@ static int __clk_core_init(struct clk_core *core)
> =20
>         /* check that clk_ops are sane.  See Documentation/driver-api/clk=
.rst */
>         if (core->ops->set_rate && !core->ops->determine_rate &&
> -             core->ops->recalc_rate) {
> +             core->ops->recalc_rate && !clk_is_rounding_noop(core)) {
>                 pr_err("%s: %s must implement .determine_rate in addition=
 to .recalc_rate\n",
>                        __func__, core->name);
>                 ret =3D -EINVAL;
>                 goto out;
>         }
> =20
> +       if (clk_is_rounding_noop(core) && core->ops->determine_rate) {
> +               pr_err("%s: %s cannot implement both .determine_rate and =
CLK_ROUNDING_NOOP\n",
> +                      __func__, core->name);
> +               goto out;
> +       }
> +

This hunk has me irked. I'd rather we export some function like
clk_determine_rate_noop() that just returns 0 instead of adding another
flag. The chance that someone can get it wrong goes down and you can
naturally grep for any clks that are using determine_rate() without
having to also include this flag in the grep. It makes it easier to
reason about as well because we can have code that just checks for
determine_rate presence instead of both (i.e. clk_core_can_round() isn't
changed). Plus a clk_ops structure is more self-contained because it
doesn't rely on the clk flags to go with it.

