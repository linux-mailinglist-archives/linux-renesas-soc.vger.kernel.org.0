Return-Path: <linux-renesas-soc+bounces-28540-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGNbLYSuoWk3vgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28540-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:47:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 268401B932E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C1089303DABC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 14:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 972394218BF;
	Fri, 27 Feb 2026 14:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uua0fC8f";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PD4paHCN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A1F27AC31
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 14:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772203504; cv=none; b=PXtKIBsiYwzTySqJb709LkU8Ic374B5uwXIZo2u+6mAgZjrhYrMK9LLDGp1WVduTK27R2+BUUuW6RDtz5+OgN1H4hhoKh9lC7q5nzz8egcWRdsxDSfjTR4Y5vD/PV5wzpDfU3kjaftNntT8lFv1YinE5YCu9dQV4nuI2wUFlkvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772203504; c=relaxed/simple;
	bh=eQ7qXAOyj81yfe/+OeMnHJ4AQMCfEecRpWABhPohsPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jc7M7P0goeNPKdFSS7chEVPaOS4mfdnnUxqOnr8rEKw4s0m0c0BRdKygWD5Dl8crttqIYM382SNHudbqx+o6jpq44dDYLzJXg100ZfW6v7JHvRnDRMP6pgP/6ILbbQuh0BJhNDzHw3//ncF4klCMyhmS5CKXdxea/i0GSp+1RvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uua0fC8f; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PD4paHCN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772203502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pjpP6CrvDx4JRD336SFvsZfBjEjd+fqZc06LPodyXOg=;
	b=Uua0fC8fsiwn9RWG5DaRKfjOcJvXQwSOYIHFOiqLtwaFGksJ1pqx2f6uR9Ddt8n4lCzO41
	JLRy5n/t154LbGmfUlabxckKm2xSgvGvuXxu2a5QsHIuOCmkvSo3dtedKKR9tKD/eY58c5
	l54cVlJjVhVzwtII4SSM55yOsqzuqVE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-QibiL5oSMB6gsrTMhYWj7A-1; Fri, 27 Feb 2026 09:44:59 -0500
X-MC-Unique: QibiL5oSMB6gsrTMhYWj7A-1
X-Mimecast-MFC-AGG-ID: QibiL5oSMB6gsrTMhYWj7A_1772203499
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899b4ce513cso203042426d6.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 06:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772203498; x=1772808298; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjpP6CrvDx4JRD336SFvsZfBjEjd+fqZc06LPodyXOg=;
        b=PD4paHCNvd1hV6pS3NF7m3px/10FhxVbT7XbblzkJjCbr/Y9Yw+yaz8/QjiakrOAAe
         Z+X2uXLz0thxfqfNqGdHAECffK1d8poOKqf5lQ7nDx1t60DwoikUJRramfqE8oIPtq96
         RQIftN+VdTHcXTcISCMHd2gDfyqE/mYx/KqaHSeTsf4PXbWzKiHPyaQ2bgpbBfeb+InB
         FfdsTFUgE7BrXouk8pGqX9mmrw0hF10Fwkbzt/til2MWJVy08+zptahFDvNUxSfEVQhn
         dAlbCXAi52HCa4djzPGtyd1wX10XEtL43YgGFqt5blfcOxe0TOR2ygqfsWP6E6ZzyMR5
         NoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772203498; x=1772808298;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pjpP6CrvDx4JRD336SFvsZfBjEjd+fqZc06LPodyXOg=;
        b=oorhb97GoIFovyuYFLp5TBsL6euqYrdTsKh15Xgay45gRGFhCw3dwZXf2S7qrVw2tC
         Kloyq+qJ3g5K7x37Rdf9w6mYd8/Jey8XiogU9Vhu/1D3hhzCMCfgA2rUZ2p02DAhGvpO
         UM+x6neZHjjrfSSF72soIUSoGFbzFWg/qp04KSxW4r3iFYDWsCeoOI/5zz4XsE73Qfnk
         ykAY7UMw8BzpSMjmdUfupWcxugCWavpEJkovRF9375wyZwSOCqFrdOKnDGpTDfojizOf
         SDw3AlCjv51Dks8eg/Fshjakecpt+NtURuVcAJdEVSB/12wnJo7A0Rk1YZfmIrIfrspZ
         VTpg==
X-Forwarded-Encrypted: i=1; AJvYcCW7qw369FDDVYQS3/6YBTXRqEgxEVoqMauPoaHgC+tiIoLcEjUlTMSOzw0DD2Zr/i+emUDXRFo4wod7AW2o+TX+6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxcdZiyK2E4ss1gv4OW0S8/aVHEO9RudD0iSwGC/HxbNsbVOPh
	e0BoZbGQ8MyIFYWE6mgyEaOauL3AoImRQecgw5kVYgip9EBGB+osyfOw+o0UyLU9ozuy+p7Y6f/
	7YlHFDIxTi7edkewq/R4KKyMg7QYBJFpCXhhNyU/W57QuM+cb7Jwnd3rqTUSFWoJCCgEDIXO7
X-Gm-Gg: ATEYQzzKnpJO5nw7YtH/6I8VMaHaQqbt7kmaTJxXDjWmNo73A/dU/gWzBF1Qp//6c0c
	6SIc7zsm9XeYbNEXtTvBagCKyJ3BGx+z0BiA1u1f1CAhnw6jqaqnusK3eXOqiCsMs1nKaMYDkQK
	YzXTwqOHgouxu3ZQ1AoZvjZkPWSuzn8T2qoN0t0Q3wWtOeikACOozaCXuK2X/zgksJzOp6HOKhc
	VimtvXImhlOp9nGao7iicGQLNQuTmSuEKZThMdSQgAoVKEzSOLY05sFj97gtMWtn1S4Dtu+sgoZ
	dROxNkwc4ZsYRdQl/vrOFG3QYuprY+w9Z6IVB/FfWCIbSdRUY7WiyurYJ6we4SJ2QpAkSaOYEr8
	oRbERGqREq2MDjH8dd+4pPDJxRSlhDA7UPwufBEuRcEwxoZ8K/8iocjwn
X-Received: by 2002:a05:6214:2481:b0:88a:2360:7f15 with SMTP id 6a1803df08f44-899d1d86467mr45187876d6.12.1772203498588;
        Fri, 27 Feb 2026 06:44:58 -0800 (PST)
X-Received: by 2002:a05:6214:2481:b0:88a:2360:7f15 with SMTP id 6a1803df08f44-899d1d86467mr45187146d6.12.1772203498037;
        Fri, 27 Feb 2026 06:44:58 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c73a3130sm45123526d6.49.2026.02.27.06.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:44:57 -0800 (PST)
Date: Fri, 27 Feb 2026 09:44:55 -0500
From: Brian Masney <bmasney@redhat.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
Message-ID: <aaGt5-ZWoXQ9Hz74@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
 <TY3PR01MB113465A96D1EEBB43C82C12A98673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113465A96D1EEBB43C82C12A98673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,vger.kernel.org,suse.com,linux.alibaba.com,samsung.com,nxp.com,glider.be,gmail.com,pengutronix.de,linaro.org,arm.com,lists.linux.dev,lists.infradead.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28540-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 268401B932E
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 12:00:55PM +0000, Biju Das wrote:
> > -----Original Message-----
> > From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org> On Behalf Of Brian Masney
> > Sent: 26 February 2026 18:17
> > Subject: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
> > 
> > There are some clocks where the rounding is managed by the hardware, and the determine_rate() clk ops
> > is just a noop that simply returns 0. Add a new flag for these type of clocks, and update the clk core
> > so that the
> > determine_rate() clk op is not required when this flag is set.
> > 
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > 
[snip]
> >  drivers/clk/clk.c            | 24 +++++++++++++++++++++---
> >  include/linux/clk-provider.h |  2 ++
> >  2 files changed, 23 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c index
> > fd418dc988b1c60c49e3ac9c0c44aa132dd5da28..0a522a0817411c7f7c6e9cffd6f024e672a331a8 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -1557,6 +1557,20 @@ static int __init clk_disable_unused(void)  }
> > late_initcall_sync(clk_disable_unused);
> > 
> > +/**
> > + * clk_is_rounding_fw_managed - Check to see if clk rounding is handled
> > +by the
> > + * firmware.
> > + * @core: the clk to check
> > + *
> > + * Clks that have this flag enabled do not need to have a
> > +determine_rate() op
> > + * set, and will always return success for any rounding operation since
> > +the
> > + * firmware will deal with the rounding.
> > + */
> > +static inline bool clk_is_rounding_fw_managed(struct clk_core *core) {
> > +	return core->flags & CLK_ROUNDING_FW_MANAGED; }
> > +
> >  static int clk_core_determine_round_nolock(struct clk_core *core,
> >  					   struct clk_rate_request *req)
> >  {
> > @@ -1589,6 +1603,8 @@ static int clk_core_determine_round_nolock(struct clk_core *core,
> >  		req->rate = core->rate;
> >  	} else if (core->ops->determine_rate) {
> >  		return core->ops->determine_rate(core->hw, req);
> > +	} else if (clk_is_rounding_fw_managed(core)) {
> > +		return 0;
> >  	} else {
> >  		return -EINVAL;
> >  	}
> > @@ -1673,7 +1689,7 @@ EXPORT_SYMBOL_GPL(clk_hw_forward_rate_request);
> > 
> >  static bool clk_core_can_round(struct clk_core * const core)  {
> > -	return core->ops->determine_rate;
> > +	return core->ops->determine_rate || clk_is_rounding_fw_managed(core);
> >  }
> > 
> >  static int clk_core_round_rate_nolock(struct clk_core *core, @@ -3528,6 +3544,7 @@ static const
> > struct {
> >  	ENTRY(CLK_IS_CRITICAL),
> >  	ENTRY(CLK_OPS_PARENT_ENABLE),
> >  	ENTRY(CLK_DUTY_CYCLE_PARENT),
> > +	ENTRY(CLK_ROUNDING_FW_MANAGED),
> >  #undef ENTRY
> >  };
> > 
> > @@ -3906,7 +3923,7 @@ static int __clk_core_init(struct clk_core *core)
> > 
> >  	/* check that clk_ops are sane.  See Documentation/driver-api/clk.rst */
> >  	if (core->ops->set_rate && !core->ops->determine_rate &&
> > -	      core->ops->recalc_rate) {
> > +	      core->ops->recalc_rate && !clk_is_rounding_fw_managed(core)) {
> >  		pr_err("%s: %s must implement .determine_rate in addition to .recalc_rate\n",
> >  		       __func__, core->name);
> >  		ret = -EINVAL;
> > @@ -3920,7 +3937,8 @@ static int __clk_core_init(struct clk_core *core)
> >  		goto out;
> >  	}
> > 
> > -	if (core->ops->set_parent && !core->ops->determine_rate) {
> > +	if (core->ops->set_parent && !core->ops->determine_rate &&
> > +	    !clk_is_rounding_fw_managed(core)) {
> 
> >  		pr_err("%s: %s must implement .set_parent & .determine_rate\n",
> >  			__func__, core->name);
> >  		ret = -EINVAL;
> 
> 
> After applying patch#11, I get a message as you removed .determine_rate, Also it breaks display.
> 
> [    0.096414] __clk_core_init: .pll5_foutpostdiv must implement .round_rate or .determine_rate in addition to .recalc_rate

Thanks for testing. This happens because rzg2l_cpg_pll_clk_register()
doesn't have the new flag set. I'll fix this, and go through all of the
others again just to make sure I don't miss any others.

Brian


