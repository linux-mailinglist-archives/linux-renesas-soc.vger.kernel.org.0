Return-Path: <linux-renesas-soc+bounces-34960-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8+3QCPWsT2pLmgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34960-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 16:15:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC48732137
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 16:15:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=Rtl+rR+v;
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34960-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34960-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 60D8E30D2E46
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 13:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00A7423A70;
	Thu,  9 Jul 2026 13:51:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F8A42EED1
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 13:51:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783605118; cv=none; b=F04kJsYcW7ooXwd41gsjJ3Fu6tYGos3zCGZJsSLqhCLf2XPN6kXRGOjnx44r+o0LalzjaRy2cLg+EEqgX1hJcgmMHA5zyUpOkIhshnhYwXpfbx3vTWlNnx6x6gV9eR+jukoXivZYrTR41+c4ZPTlHyuRe3T5hdovav3X/p5icjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783605118; c=relaxed/simple;
	bh=YhzlfPd0hTh8S+xkIpvYunh0o/0tYbuHg+no0ssYtgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aQq00DRjVVpkeurocBLgMl4dIgD/8gigTi+PZVrwPogbZ0B9hZPLzS1X3hNvrwE9vqlt7CHfvV8Z8lb2weIpD5e/X8/tEplLK1ukfe1ayt2uqxGV8uVjbH1fYYAFC56/UrFSQe64mzoFmsQK93V4KCLRuINTwXzmXd/0HL3Gycw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rtl+rR+v; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783605116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ysWlghC9J8ScLCpP/g8zxoZvmb5MDE+iTRZ+tsKYUa8=;
	b=Rtl+rR+vev5TNvvvEsLlz5/AesxWhaCzn+yOEstH01z81Lt1ZgnzKsnfATT5Q0lsVS8aT0
	29v5kyMmYWkcBxQ+pEO0w+SqqhfRILOq1wTLJWkCU/l0xHee1qNijefcrwDRshg2fPgkto
	J2cahNmvO/Or50qmzp3f1U82yHjr8d8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-648-0XHMz5IlPXOl-THAHDU14g-1; Thu,
 09 Jul 2026 09:51:54 -0400
X-MC-Unique: 0XHMz5IlPXOl-THAHDU14g-1
X-Mimecast-MFC-AGG-ID: 0XHMz5IlPXOl-THAHDU14g_1783605112
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8369C19560B5;
	Thu,  9 Jul 2026 13:51:51 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.33.79])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E6FCC1956089;
	Thu,  9 Jul 2026 13:51:46 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: niklas.soderlund+renesas@ragnatech.se
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	richardcochran@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next v4 2/3] ptp: Add driver for R-Car Gen4
Date: Thu,  9 Jul 2026 15:51:41 +0200
Message-ID: <20260709135141.243782-1-pabeni@redhat.com>
In-Reply-To: <20260702125525.2230427-3-niklas.soderlund+renesas@ragnatech.se>
References: <20260702125525.2230427-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34960-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[pabeni@redhat.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund+renesas@ragnatech.se,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:richardcochran@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:niklas.soderlund@ragnatech.se,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:url,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DC48732137

From: AI Reviewer <ai@example.com>

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://netdev-ai.bots.linux.dev/sashiko/
---
ptp: Add driver for R-Car Gen4

This patch adds a standalone platform driver for the gPTP timer block
on R-Car Gen4 SoCs (S4, V4H, V4M). The timer shares its module clock
(and reset) with either RSWITCH or RTSN on S4/V4H, and has its own
module clock on V4M. A pre-existing implementation exists at
drivers/net/ethernet/renesas/rcar_gen4_ptp.c consumed by the RSWITCH
and RTSN drivers.

> diff --git a/drivers/ptp/Kconfig b/drivers/ptp/Kconfig
> index b93640ca08b7..3593fd9da92a 100644
> --- a/drivers/ptp/Kconfig
> +++ b/drivers/ptp/Kconfig

[ ... ]

[Medium]
A pre-existing driver drivers/net/ethernet/renesas/rcar_gen4_ptp.c
already implements essentially the same hardware programming
(identical register offsets, identical adjfine/gettime/settime/adjtime
bodies, identical addend derivation) and is still consumed by RSWITCH
and RTSN via rcar_gen4_ptp_alloc() / rcar_gen4_ptp_register().

After this patch, the same silicon can be described two different ways
in DT (embedded in RTSN as reg-names "tsnes"/"gptp" versus standalone
renesas,rcar-gen4-gptp) and driven by two different code paths.

On r8a779g0 the DTS already keeps the 0xe6449000 gPTP registers mapped
both from the tsn0 node and from the new gptp node, so nothing
prevents both drivers from mapping the same MMIO region and racing on
control writes.

Is there a migration plan for the existing consumers, and can anything
in the binding or driver reject the double-bind case where the same
register block is described both ways in one DT?

> diff --git a/drivers/ptp/ptp_rcar_gen4.c b/drivers/ptp/ptp_rcar_gen4.c
> new file mode 100644
> index 000000000000..0d862849cd4c
> --- /dev/null
> +++ b/drivers/ptp/ptp_rcar_gen4.c

[ ... ]

> +static int ptp_rcar_gen4_probe(struct platform_device *pdev)
> +{
> +	struct ptp_rcar_gen4_priv *priv;
> +	struct device *dev = &pdev->dev;
> +	unsigned long rate;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	priv->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(priv->clk))
> +		return PTR_ERR(priv->clk);
> +
> +	rate = clk_get_rate(priv->clk);
> +	if (!rate)
> +		return -ENODEV;

[Low]
Is querying clk_get_rate() before the module is powered up safe here?
The clock is queried before pm_runtime_enable() / pm_runtime_get_sync()
runs, and some clock providers legitimately return 0 for a gated
clock, which would make probe return -ENODEV even when the rate is
well-defined once the module is powered. The older driver received
the rate from the Ethernet parent driver after its own
pm_runtime_get_sync() had run.

[Medium]
The DT binding declares "resets" as a required property, but the
driver never acquires a reset_control (no reset_control_get() /
reset_control_deassert() / reset_control_reset()).

On the Renesas CPG-MSSR reset controller, reset deassertion is a
separate operation from clock enable; clocks are not implicitly
deasserted.

On V4H (r8a779g0) this driver depends implicitly on the RTSN driver
calling reset_control_reset() on the shared module reset ID 2723, but
that reset_control_reset() will also asynchronously reset the gPTP
block after it has been programmed here. On V4M (r8a779h0) where the
binding also applies and no sibling driver exists, nothing would ever
deassert the reset.

Should the driver acquire and deassert its own reset_control, or
should the binding be revised so that the driver does not appear to
support V4M standalone?

> +
> +	spin_lock_init(&priv->lock);
> +
> +	priv->info = ptp_rcar_gen4_info;
> +
> +	/* Default timer increment in ns.
> +	 * bit[31:27] - integer
> +	 * bit[26:0]  - decimal
> +	 * increment[ns] = perid[ns] * 2^27 => (1ns * 2^27) / rate[hz]
> +	 */
> +
> +	priv->default_addend = div_s64(1000000000LL << 27, rate);
> +
> +	pm_runtime_enable(dev);
> +	pm_runtime_get_sync(dev);
> +
> +	iowrite32(priv->default_addend, priv->base + PTPTIVC0_REG);
> +	iowrite32(1, priv->base + PTPTMEC_REG);

[High]
Should the return value of pm_runtime_get_sync() be checked here?

The kernel documentation for pm_runtime_get_sync() notes that the
usage counter is incremented in all cases, including error, and
recommends pm_runtime_resume_and_get() when the caller needs to check
success.

If resume fails, the module clock may remain gated and the subsequent
iowrite32() to PTPTIVC0_REG / PTPTMEC_REG would touch a clock-gated
CPG-MSSR module, which can raise a bus error / SError on ARM64. On
top of that, the usage counter is leaked on the error path.

Would something like this be more appropriate:

    ret = pm_runtime_resume_and_get(dev);
    if (ret) {
        pm_runtime_disable(dev);
        return ret;
    }

> +
> +	priv->clock = ptp_clock_register(&priv->info, dev);
> +	if (IS_ERR(priv->clock)) {
> +		pm_runtime_put_sync(dev);
> +		pm_runtime_disable(dev);
> +		return PTR_ERR(priv->clock);
> +	}

[Low]
The remove path writes PTPTMDC_REG = 1 to disable the timer before
dropping the runtime PM reference, but this error path (when
ptp_clock_register() fails) does not. Since the driver has no
runtime_suspend callback that would stop the timer, should the probe
error path also issue iowrite32(1, priv->base + PTPTMDC_REG) for
symmetry with remove()?

> +
> +	return 0;
> +}
> +
> +static void ptp_rcar_gen4_remove(struct platform_device *pdev)
> +{
> +	struct ptp_rcar_gen4_priv *priv = platform_get_drvdata(pdev);
> +	struct device *dev = &pdev->dev;
> +
> +	ptp_clock_unregister(priv->clock);
> +
> +	iowrite32(1, priv->base + PTPTMDC_REG);
> +
> +	pm_runtime_put_sync(dev);
> +	pm_runtime_disable(dev);
> +}

[Medium]
There are no system-wide dev_pm_ops on this driver (no .suspend /
.resume / .freeze / .thaw / .restore, no SET_LATE_SYSTEM_SLEEP_PM_OPS).

Even with the DT placing the device in R8A779G0_PD_ALWAYS_ON, module
clocks can still be gated by pm_runtime_force_suspend() during a
system suspend/resume cycle. When that happens, PTPTIVC0 (addend),
PTPTMEC (enable), and the timer counter are all liable to lose state,
and there is no callback that reprograms them on resume.

Because ptp_clock_register() exposes /dev/ptpN to userspace, would
ptp4l / phc2sys see a silently wrong clock after a suspend/resume
cycle? The older driver was tied to the Ethernet driver's PM chain,
so this hazard is newly introduced by making the PTP block a
standalone driver.

> +
> +static const struct of_device_id ptp_rcar_gen4_of_match[] = {
> +	{ .compatible = "renesas,rcar-gen4-gptp", },
> +	{ /* Sentinel */ },
> +};

[ ... ]
-- 
This is an AI-generated review.


