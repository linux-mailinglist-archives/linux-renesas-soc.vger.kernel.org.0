Return-Path: <linux-renesas-soc+bounces-31757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SE3sLRoP8mkwngEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 16:00:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 566E8495441
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 16:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A77D30C8C62
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 13:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3535737A4BA;
	Wed, 29 Apr 2026 13:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aaye5le9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aIpiukdD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6AC318ED7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 13:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777470949; cv=none; b=WXFEMNTWXvpBmZSSrJcN4AHRTEp+2YXYRreddOnad151TKcXq83KNBevb20bHx9Yn/JJK2NuAkLTfJ8OOkCRRd0aky0K6KCstRoB3qN1uOoSeMrQNkcXxsLRDzKWtoMnWG71aUYKGPmLFDujkjZcTm1ZW6vZcldxCp+rg7+Pm8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777470949; c=relaxed/simple;
	bh=buDqtxL5iiA+P59BL7gOogsMTPfTAbw/6u3MZ3bRXX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iojNo2ZKiLFJqEm1nFUvDW7mIEbatYrOZ9Eg0mrwqCtJMIsqOwunL1yDcqQSsZynZMqF57hsyjqFFxdcl08Bbw8HM03NzfUdsI8BaQCCLCRSBlqApau/8JzlJYXR2qJQqqFHjs8GlsU2cGZIEJa4dPDn/H9kmiHHnm3ctfIUazU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aaye5le9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aIpiukdD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777470945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E4gmtst5bATy4vi+nqQOmDuupzzNRv5w7Vbola4ydK4=;
	b=aaye5le9VF60v6sPq4CiCo/9qzuijopOb5flH3s2LuBRfAMvPzMGoAoqOxQUO0Mah2s6I7
	xZwl9Rt/ndjWlsIfBeDqIBI5tNcIpm5MaQnpq6TY6iuFhvQPjgIjN4ZmdwPGdTCf/gn/hW
	6NQxs60dSSYqLLlGdFhQxLqCDm4jyOA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-TjkA0aQOMFGZOLyFILfJBw-1; Wed, 29 Apr 2026 09:55:44 -0400
X-MC-Unique: TjkA0aQOMFGZOLyFILfJBw-1
X-Mimecast-MFC-AGG-ID: TjkA0aQOMFGZOLyFILfJBw_1777470943
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a275472d89so199209666d6.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 06:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777470943; x=1778075743; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4gmtst5bATy4vi+nqQOmDuupzzNRv5w7Vbola4ydK4=;
        b=aIpiukdDtwMfeu5U8x7pAWQk1igCGTDDEl1VOIRCChHAvLkCYOLBCQMfizk5Wc6fa1
         GOG7IQiJq7VDTj0HSc8ckVqTRf1S3/KpuB0/d32uzyX0YHIZtw7RBZqAx+ZKrN4UVTfo
         Wk1sSJ6utW7+ydSYNVH+UhTbbxJlUjVTI7IZn1ILhR0IfiXHZB5FK1FPmbY826fn3LT0
         VwS6vJoA4sAMMTPJlEBvIFwXLFoDtJDwsQN34h9RA3ZoKjoIjywy/A2laQ+5cpldXa7L
         yxl2MXhjHWhVfwRurbF3kN1ap7u0rixf/xvcabi7NTBsFk9RW779MIc6azHgnNL/kLMM
         gDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777470943; x=1778075743;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E4gmtst5bATy4vi+nqQOmDuupzzNRv5w7Vbola4ydK4=;
        b=VPbirn+XbBD7q1+9VoV+T5pqhevKxqTwlaW18bGP4ce+q7Nb5emxLUlj88DbK20/dX
         +rjv2gIyz46CWPfMfdQa11QPLcE5naLC1ZvAIP5x/25OOVZMrUrz4p5urpnuyOVAnwYV
         cbSr75w0rs9pjoPtKqCETHTisazyAYJSUVlSokvRrjTy65hwnB6AdOYIn1+avvknOn22
         kYaPtLX0Q23/D8UHZ0UXUZJ9Ftn5yPRQkicB9RWNNmosbmLOMEA1QFyR/BR+chafhqp/
         scGUFG8W6zZdWVvNeZMm+1f3xTYM3T/2/GyBYOWFhWHcMzbY1KVhR82X8qeRlVJCUFTa
         t4bA==
X-Forwarded-Encrypted: i=1; AFNElJ8JySZqMvFfwvHN9TY5GODd1ZNrjqBQgiiQoNXsF9RpJPtyBs2iGawnF5VC5g0p78y9QoywvpkP0OqLNKqIau3ANQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5VVzwoDtPXX7abhiIv+AnjFgoAdp+lpxJHiEQnIrYBhtFbhCR
	9v7oawvchK6b/JP4+eqS+5lzePrA50TmihYwMW92rxxWxlDj+rpyOOkDGmPydzN1g/HA1knAzGw
	gIhMIEF+yIGzN49R7dG6cs8weWjlfLn+1QCgxHb5SUk+p++MSy146szXT8/788ERy4P6Fc58Y
X-Gm-Gg: AeBDiesmutNX/GXywCCfq9zfjVaK6eNeCmq4PFfYh/sH41Rda2lMNXfxhRTRNzRfGd0
	77+oJfp5VdnEIT1pTrUZWYAEa6CSRgV2Kj0DfYIBB7JhDLAzaWlYO6hksFEhiOgODe5D7lDNIdw
	FL9nwlsJXK2L9cjYfjmQ4fFOK071GyYxDqYSlwsXSktK6L376YbqL8USOPcKSGjb6xdxBU/oxtQ
	vJNWYCOR0shue3mCJm6/EvG5WnukqLH9nY1WVOs1dHAoZtu1hQz7N9foVOtgba9YfoXjJR7zNzd
	Yq+dez2BZJUBGS47Tsn2W0SL/rmPqmGKoB56ytgFLSC6fJAkelwtsSdRSTW+pHmIRVzvTqLyF9u
	hmx3jXxw7gT6ygjl/fLXh9r+s8a08QXozcz15RMu5gk+mHKBfKO/xW1LhGCbX6fhfpfM=
X-Received: by 2002:a05:6214:600e:b0:8ac:aeb0:2eb4 with SMTP id 6a1803df08f44-8b3ede04448mr57443896d6.45.1777470943517;
        Wed, 29 Apr 2026 06:55:43 -0700 (PDT)
X-Received: by 2002:a05:6214:600e:b0:8ac:aeb0:2eb4 with SMTP id 6a1803df08f44-8b3ede04448mr57443326d6.45.1777470943011;
        Wed, 29 Apr 2026 06:55:43 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef86e2f1sm21005096d6.48.2026.04.29.06.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:55:42 -0700 (PDT)
Date: Wed, 29 Apr 2026 09:55:39 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2 01/12] clk: add new flag CLK_ROUNDING_NOOP
Message-ID: <afIN2y_PCGofGAKD@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
 <20260309-clk-det-rate-fw-managed-v2-1-c48ef5a3100a@redhat.com>
 <177742893645.5403.3938693995862346406@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177742893645.5403.3938693995862346406@localhost.localdomain>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Rspamd-Queue-Id: 566E8495441
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31757-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[baylibre.com,vger.kernel.org,kernel.org,suse.com,linux.alibaba.com,samsung.com,nxp.com,glider.be,gmail.com,pengutronix.de,linaro.org,arm.com,lists.linux.dev,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]

On Tue, Apr 28, 2026 at 07:15:36PM -0700, Stephen Boyd wrote:
> Quoting Brian Masney (2026-03-09 07:38:40)
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index fd418dc988b1c60c49e3ac9c0c44aa132dd5da28..1187e5b1dbc123d2d2c1f43690d7dcf75a7c4ac3 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -1673,7 +1690,7 @@ EXPORT_SYMBOL_GPL(clk_hw_forward_rate_request);
> >  
> >  static bool clk_core_can_round(struct clk_core * const core)
> >  {
> > -       return core->ops->determine_rate;
> > +       return core->ops->determine_rate || clk_is_rounding_noop(core);
> >  }
> >  
> >  static int clk_core_round_rate_nolock(struct clk_core *core,
> > @@ -3528,6 +3545,7 @@ static const struct {
> >         ENTRY(CLK_IS_CRITICAL),
> >         ENTRY(CLK_OPS_PARENT_ENABLE),
> >         ENTRY(CLK_DUTY_CYCLE_PARENT),
> > +       ENTRY(CLK_ROUNDING_NOOP),
> >  #undef ENTRY
> >  };
> >  
> > @@ -3906,13 +3924,19 @@ static int __clk_core_init(struct clk_core *core)
> >  
> >         /* check that clk_ops are sane.  See Documentation/driver-api/clk.rst */
> >         if (core->ops->set_rate && !core->ops->determine_rate &&
> > -             core->ops->recalc_rate) {
> > +             core->ops->recalc_rate && !clk_is_rounding_noop(core)) {
> >                 pr_err("%s: %s must implement .determine_rate in addition to .recalc_rate\n",
> >                        __func__, core->name);
> >                 ret = -EINVAL;
> >                 goto out;
> >         }
> >  
> > +       if (clk_is_rounding_noop(core) && core->ops->determine_rate) {
> > +               pr_err("%s: %s cannot implement both .determine_rate and CLK_ROUNDING_NOOP\n",
> > +                      __func__, core->name);
> > +               goto out;
> > +       }
> > +
> 
> This hunk has me irked. I'd rather we export some function like
> clk_determine_rate_noop() that just returns 0 instead of adding another
> flag. The chance that someone can get it wrong goes down and you can
> naturally grep for any clks that are using determine_rate() without
> having to also include this flag in the grep. It makes it easier to
> reason about as well because we can have code that just checks for
> determine_rate presence instead of both (i.e. clk_core_can_round() isn't
> changed). Plus a clk_ops structure is more self-contained because it
> doesn't rely on the clk flags to go with it.

I also like the clk_determine_rate_noop() approach much better as well.
I'll send a new version.

Thanks,
Brian


