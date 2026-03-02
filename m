Return-Path: <linux-renesas-soc+bounces-28669-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLrtHULFpWnEFgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28669-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 18:13:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEBB1DD9F8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 18:13:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4A1233021410
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 17:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89360426EC4;
	Mon,  2 Mar 2026 17:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A3ZOVilY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="efAO2olH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A8242EEAA
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 17:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772471486; cv=none; b=TaBNbjDgE8nuJ2gMGNPxrWDFLQKSjsQXjBfGlwdx5HjQuP9s3H8N+3bZhodxdGS8Pufr3WhsgodAYhac+jYDHn0zWuRrAvFkFKk9lH4piWWPLAdi2jXwyqruD1XX77Bdu98aQQlTpY7D36p/nmXI+Q5B4ptL4MsF30DxbpANGl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772471486; c=relaxed/simple;
	bh=Lds6rOZ7X/3g6xC/UqVG/xiT2+rkqLBII+J5UpiKeEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iYgdYrHxP/doYPaw0pPjKNzlil52MoVwQmJX8G7KsyxO9o9GNta0Mof7+qIYsqXMeac6q6laDcg3hb27QkJEcC3uQ2Gc51vtT7lb9rzRsxA2qFDv8E048kniZY/LAJpWB2XtAU2RqRIVnU3Bcl6c/Ihs/A+Su45q1np1eJ/zjCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A3ZOVilY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=efAO2olH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772471480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dTT0P65qbG5CTQSoBKTT9PgPPtpnw8OX1DWXnZ+KTiU=;
	b=A3ZOVilY2d98ppWsTwrVLfdOqYhWl9KF8Ob1FvP3OK5Xx6l6XNSrwbdK4qFpggrGLeONwf
	w3dTZLE7wuXyDYpFeM7KfPXYWoTRZKiTvVIsPILFjBEwQ9RV0T9chOUdy3UodMereadq9G
	g/VseJjy02GGvOJypLe41tUKM/BgJxM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-FDKfZAm2NC-7Tz1d_7FN8A-1; Mon, 02 Mar 2026 12:11:19 -0500
X-MC-Unique: FDKfZAm2NC-7Tz1d_7FN8A-1
X-Mimecast-MFC-AGG-ID: FDKfZAm2NC-7Tz1d_7FN8A_1772471479
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71655aa11so5185639185a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 09:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772471479; x=1773076279; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTT0P65qbG5CTQSoBKTT9PgPPtpnw8OX1DWXnZ+KTiU=;
        b=efAO2olHnXWjbEwSzNJ9zmXzNimkl4eB8P5Cys0iWbvE4onmeeMgZiVV36RhKxbKJi
         DlkgH65lX9apaQM7M3U0sX7FiqyySd3TuAMea2lFBrhyaYVIDMNhW5gZj2DshozYIrGV
         prTjzmFNSTKr9p0jdTpc1fXT5db3tpdqvRAeyNY4Mem8Wa/YY1oELZrpAE6vUZwppUIy
         BdEjyvz9mjAg+WLpIUQoIWb5EADn3iy76Mi22BnMEFNpMk58DOrokfqTuvC/KVfxXQoe
         R1nKb6eOkDLFXLPfNB5my7IK69cfMQAW85hg6YslsG53VLYUeObz3ix3jahtl+sfOwgG
         v6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772471479; x=1773076279;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dTT0P65qbG5CTQSoBKTT9PgPPtpnw8OX1DWXnZ+KTiU=;
        b=OcQvYYLoJLBA+6CRjujezqwltMp2qp/3uCJNKBWZWbfezGZHGgyHWrhGSzkyYEJt1I
         FZFhstuAZf77k/4cMV7NdokpzpMRX9dcFMCDYrsvejUgV9cmzAj4VA8DWPFMo5v9qdGS
         dWNWNTKaO4kHjXxFUu7purCwNGNQqqmc8Ju8Ui55gNSFQSgbmD82tfOJIt5kx6caq/sr
         tAvIYdiJpi32y/asG0yYwTJiE263XppaaZwdFEXeMmdM0EifzxefW6n8hHJR19xU0zM7
         7n27LzQOAp94HBQ2zei6w17GveN5GYpn5tM9u3rF92HBUYA05PAzQ9qD93arkmfN+IUK
         PqXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSzF3ikvY6Bt20mT2ucHoU3PbwUatSqcentCAp4u5uKMlLqPykGE0r/FdpfsB+2yTBMXV7RaNnEyWIDCDbR4JwvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfnBUIN/daYWJ7sM+V42aPKAKQZA7/o6T6ZZu8OkdB30j72dLk
	zhQZkIffCxXIgxrBpSWzcFdSvutE2fo4cGzS4gM56KxdO/JpD3qgeH8HR0DF/WBqLiXfISNp7lG
	9iy6d9Liq9jCZ78CgA3txtwaYerf+FwiDyqaYWJMGIpn7KWQEYvcf1ApKRAQ+1TVQSJBeqqvA
X-Gm-Gg: ATEYQzzIyJDIK0IcL4ePUyZTmfUHvcD++kKmWrdofqq1IoEcwuYjCarT4xiiYph4+jl
	ByFp2Vbho/yyejWIU6V+iv4BZow0WpWUHiIn+rmwpeDKVj0AmsPRUKBQVUBOQhKJ26fYhK9V+tD
	kH6rxZBS0jjVShwmnsjH48JFTjvn2WrINhHg7FMgYqXs18fCxDmvqH61BfANj3luTbq0V0PTKYk
	2WKIw33x6rZQ1WYkBvOhoQbbXWRQVaubWyZzv3F9LtTrjg+f/JDG1yT1CH3v2F8yr9AbxaktQJj
	Ww7CMaqScVzTVj73oRnyBomFKsbc3Eymb53EdT61HMKtGs6mssolUDv/29kmljY3csOvfZWRN57
	bzClNlvEweO/MnkRm7bj4zxdKU1o8Mck/VYvB5NoyvTBJ5g7G7MD2ak+f
X-Received: by 2002:a05:620a:28d6:b0:8c9:fb0e:ca43 with SMTP id af79cd13be357-8cbc8deb20fmr1599859985a.24.1772471478970;
        Mon, 02 Mar 2026 09:11:18 -0800 (PST)
X-Received: by 2002:a05:620a:28d6:b0:8c9:fb0e:ca43 with SMTP id af79cd13be357-8cbc8deb20fmr1599855585a.24.1772471478512;
        Mon, 02 Mar 2026 09:11:18 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6534f3sm1172998185a.5.2026.03.02.09.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 09:11:17 -0800 (PST)
Date: Mon, 2 Mar 2026 12:11:16 -0500
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 02/11] clk: scmi: Use new determine_rate clock operation
Message-ID: <aaXEtNilpRYhwmYc@redhat.com>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-3-cristian.marussi@arm.com>
 <aaI9JBwWaMmfBbd/@shlinux89>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaI9JBwWaMmfBbd/@shlinux89>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Rspamd-Queue-Id: 1CEBB1DD9F8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,amd.com,glider.be,renesas.com,baylibre.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-28669-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 08:56:04AM +0800, Peng Fan wrote:
> On Fri, Feb 27, 2026 at 03:32:16PM +0000, Cristian Marussi wrote:
> >Use the Clock protocol layer determine_rate logic to calculate the closest
> >rate that can be supported by a specific clock.
> >
> >No functional change.
> >
> >Cc: Brian Masney <bmasney@redhat.com>
> >Cc: Michael Turquette <mturquette@baylibre.com>
> >Cc: Stephen Boyd <sboyd@kernel.org>
> >Cc: linux-clk@vger.kernel.org
> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >---
> >Note that the calculation logic in the protocol layer is exactly the same
> >as it wes here.
> >
> >@Brian I suppose once your CLK_ROUNDING_FW_MANAGED sereis is merged I can flag
> >such SCMI clocks.
> 
> Per my reading of Brain's thread, if ->determine_rate exists,
> ->determine_rate() will be used.
> 
>  	} else if (core->ops->determine_rate) {
>  		return core->ops->determine_rate(core->hw, req);
> +	} else if (clk_is_rounding_fw_managed(core)) {
> +		return 0;
> 
> So unless update scmi_clk_determine_rate() to something:
> --------
> if (clk & CLK_ROUNDING_FW_MANAGED)
> 	return 0;
> 
> return scmi_proto_clk_ops->determine_rate(clk->ph, clk->id, &req->rate);
> --------
> 
> It maybe better to update Brain's patch to move clk_is_rounding_fw_managed()
> above the check of core->ops->determine_rate().

The clk framework has some basic sanity checks in place that are called
during device probe to ensure that various ops are configured properly. I
could add a check that if CLK_ROUNDING_FW_MANAGED [*] is set, and a
determine_rate() op is set, then it gives an error.

[*] Note: I am tentatively planning to rename that to CLK_ROUNDING_NOOP
in v2 in about a week.

Brian


