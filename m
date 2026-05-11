Return-Path: <linux-renesas-soc+bounces-32391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBrpNQ7uAWpHmQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 16:56:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E15510AAB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 16:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71EBB305809D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 14:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E703366DB5;
	Mon, 11 May 2026 14:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YTXOEBYP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rprTTBpv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65018401496
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510829; cv=none; b=qfEgUYD8z8LK54HlMN9w/ywR4h/JmFSmcR3i+hCz13OyS/v2l/8/Q/TsixNeB+opV8ZdIhGzvHvPIQ9rG5HAfAAWTrf1U9WMtX7SlgNOryH/VUsTAOpTDKbi/4AsxLpI1Zw9HmXrQTWfgdN1UQRy06HLcdzwly8oihgJPAy8eqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510829; c=relaxed/simple;
	bh=Tuk6Cpk8cxw0DoMwyejCxEWUJP6eeioUgkg4CQQALUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENckb2lXVTD+UMTFVa5akqFpntr34/pJDZFBmimM0f5pCIPOYt2MCzJOsxk2C7DFTiDtIeJ96S/qkvHmtluCwk4IoYTmWwc+7IKz8saD6fNlOFRObV+h2E052ktfCzBSaAWXGtclsS9Brchle7nRn1M9G6vTvDJ9Fte6271T7II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YTXOEBYP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rprTTBpv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778510826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u+Cerdam1U54WBH71GKfZQRR4jeB6y2Uccd1vRw3E2Q=;
	b=YTXOEBYPiqZanRUYMSvkRkNilWamWWZWzaUy68JzmAKIYJfJaSe3e0Zu3wJ2Ufo6iyzeFB
	GhfcXBR5fCjNJ3ycViOSlyh3RI13qCXIuPUYII96O4EY3peVkPM5gf8RaaXxHTEVs03pEM
	ni24s//4CZr09epDW79tNR90Iap/gWE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-1C5ggwwZMDO_Sf0NgUW98A-1; Mon, 11 May 2026 10:47:05 -0400
X-MC-Unique: 1C5ggwwZMDO_Sf0NgUW98A-1
X-Mimecast-MFC-AGG-ID: 1C5ggwwZMDO_Sf0NgUW98A_1778510824
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8b7105dfb5eso96210306d6.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 07:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778510824; x=1779115624; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+Cerdam1U54WBH71GKfZQRR4jeB6y2Uccd1vRw3E2Q=;
        b=rprTTBpviGTAuurEOFiAytQ0HhaLrBKKC2EjA9BtX0xTSB077QZhSDejbmVoYDyhzs
         Y2PEmi5kZNpSy9K1nwlc5k7f1lf/3toZEP5AJTfJbWuwZUc5nbtj2eWhw+87W1npT3IQ
         tKu6xxwtG1xmnxOCdSIbNplWzx2ySqOBQqSFvEVmV28Q0LVuYXedD29UKw/GX5XZQjbg
         bqb1UqleahzZP3BAIp6ijGU2V3fSIcyD98epkgCMP88S4bvWME8TlC3agxoOmRbCnbJd
         rCYgfIGY3suGcCnsEwuktQl5El2+WM6Tu3JwfBNnDSdXC0dqaKSUppe2Chaa6+JU3uOx
         adlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510824; x=1779115624;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u+Cerdam1U54WBH71GKfZQRR4jeB6y2Uccd1vRw3E2Q=;
        b=GtdBlXMw8Yeq/NFvRJd+MCG0hs5sfbcptgSIEb+35EP0jN/aw/Flwsm3wz05I/ZxY7
         g+tlCLqmsJ4ylIW3oV+LWahVhCeO9bkHqnwbrQHDWiYWTc3vfr9yZv4Y09XA8tunw7jJ
         BR7dVvfsuXTdkSWVnyLDlP0r0Bo+5xepeZd+97IICkDh1R9yZGfjPB9CarqAsGLObOIy
         f5vTAHOFSZmoHIPP2ri/Szird9K+oR6y+cGt8RaCfdbZuwoMQ5HoFU/wwMqo6ryVGYi5
         TyA5i8BSz6Yo4afBtnfowZiKhyTxrJcedNfKenfHTbI7blnlDJtbrb0MngUC4eC+NoNR
         jF/A==
X-Forwarded-Encrypted: i=1; AFNElJ9WHcRbEb22WvKSt5CBJvaaFFb69r3y0/KEtOTNNw/XZvD7BDmX34DnpdnSIQ5eX0rJGZiyXynMj2md5pcQsxRyUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbZdxkW73pNN53E0cqNE8aXDdfqQwMbqWvJsSrBwxyGvJURVZo
	jzlchQcPrMq8DByNEUnLDQcfNxvdeaul4bUdC1tkwOAnl/Kfktxgl2WK9m+48AZYX3lwongOZaS
	mKHPKf3y0KDqcRJyzFsJRP0RqEm0dhfFeFDbqw661lSa4Z1s2SIt94le8g/t1GNOuR7X/6qcG
X-Gm-Gg: Acq92OEj9q6JD2RchJpqQekqTo52Nl9RD9Ug/3j3tQBPPLNV7e0R5uqyJYBPev8CcJU
	nmTXcDBLvJobRyQQBUle7ovd+yo3s8zo0ihJn6G/PQyWPXqBRJT/fjHmTHMeiii4Tq08xBCkh8g
	QpF6yvk9z8XpWNYKZWaaHGU6unwnYAqRhropAAWWCVpZsUzUesw8J/RVwWVALVh01+Ci5YBQa9A
	n7L+JGZn0H5IhhAGG1RKRrs8Ioazw/KnBJo0id+AgiXUB2wUk35xVRt/CS1kkqH2oLWyYv+wbFi
	GvzXatjTclgwMmFSasWo4ON1Y5HjagpsgptwPTYaEHdEiK3uoSaWBRy68qKSKbMHGS6DZSrTVaO
	T9xOSbvYT2Jqh7Kj+jnDFnduiRvlOU9LHxv9Ud1gqaIvUDPqkR3yXybmd
X-Received: by 2002:a05:6214:242d:b0:8ae:6587:3d54 with SMTP id 6a1803df08f44-8bf4302e586mr246563756d6.26.1778510824396;
        Mon, 11 May 2026 07:47:04 -0700 (PDT)
X-Received: by 2002:a05:6214:242d:b0:8ae:6587:3d54 with SMTP id 6a1803df08f44-8bf4302e586mr246562986d6.26.1778510823795;
        Mon, 11 May 2026 07:47:03 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53d6442d0sm310791716d6.46.2026.05.11.07.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:47:03 -0700 (PDT)
Date: Mon, 11 May 2026 10:47:01 -0400
From: Brian Masney <bmasney@redhat.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com,
	michal.simek@amd.com, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 05/15] clk: scmi: Use new simplified per-clock rate
 properties
Message-ID: <agHr5VZAPvZkSlJQ@redhat.com>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
 <20260508153300.2224715-6-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508153300.2224715-6-cristian.marussi@arm.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Rspamd-Queue-Id: 05E15510AAB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com,baylibre.com,kernel.org,nxp.com];
	TAGGED_FROM(0.00)[bounces-32391-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email,nxp.com:email,baylibre.com:email]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 04:32:50PM +0100, Cristian Marussi wrote:
> Use the new min_rate and max_rate unified properties that provide the
> proper values without having to consider the clock type.
> 
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


