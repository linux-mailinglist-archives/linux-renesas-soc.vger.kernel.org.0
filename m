Return-Path: <linux-renesas-soc+bounces-32390-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBXBDs3sAWpHmQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32390-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 16:50:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FCC510928
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 16:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A9ABE3084892
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 14:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618023FE652;
	Mon, 11 May 2026 14:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I+5KAHlp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UbtGm/Fo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60CE3FE34B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 14:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510699; cv=none; b=iSU7Rqyj5pmeW1900ZjX4tA1/txFSqX9MKNxDzEvnybC272AyXG7HkfYD/JXzicj4qJ4YsM+hRm4x/inwGlexmpW9u7jbXeGPEVGVlfrC+muHRFefwS9Dg1k/m9MvnFq1Bg5NGW1IvUWOujP0eZf9ryxPmCUo0nWTqxwTrm5h6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510699; c=relaxed/simple;
	bh=MFiTN0Yfk5929QM8ZG3xqo3c4QVdL3MMPUViXHHZdag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9M6wPMb69nb4qcqDHlxeyPuYxmLHPkowtLkymgAKdkUNYBcT710YcyYWT1UiEEG7469MG9zDPi5Wz4eyoqId/E6Sn//EM4a/xXU9ecROPm1QXPq873d/KiRKHU//WANzjisF4WKglN70LCmKxeSjxfusqpV4ncjflccJvK6gGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I+5KAHlp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UbtGm/Fo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778510697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FU31spM6LjzcyHuFHmDris1Hu7nsA7C7uZ0OzEouoRE=;
	b=I+5KAHlp8+yv3JdACpupEtPAaer5R3en+mJ5BW/QdJNmNdp/dF+KS4Xvqg2mVuvP4GjZIK
	F3hncqN9/CNuKLmGENGZFgmGZ1aX9wU3DAkrM7jsd5Hpq7GpBIn1Rf1IOuARddwbWRXxBC
	9bF2S0r8xCn2RP85urZgf4pOBTgBBQg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-Wf7arxqsMHG-NWBcPaF8CA-1; Mon, 11 May 2026 10:44:55 -0400
X-MC-Unique: Wf7arxqsMHG-NWBcPaF8CA-1
X-Mimecast-MFC-AGG-ID: Wf7arxqsMHG-NWBcPaF8CA_1778510695
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514b673c8f1so44545821cf.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 07:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778510695; x=1779115495; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FU31spM6LjzcyHuFHmDris1Hu7nsA7C7uZ0OzEouoRE=;
        b=UbtGm/Fo+JfWxBIDdzkUFBMjn0FpzbT6ERhgOPmBIBjx+ndX+PSfzbuKdODEZf6OYd
         ywtfWtnKMP15Trsl5ivhWPwQ2dnn7p5MwtiwnQb70ut8up9OPA0MhSD3NdbORf/0Mmjg
         7U5KvN9uZrBxodoRbL/7HnqJMU/veqf4gHcP9wru53rMqETSXSh6sPe6hjEDgzp/kxYf
         MgmxcNFcoBdiedm83deIU6cbUscSh/6KMGTCZQlnf2fAfVPvb9J102tc265XIdhAXrFr
         zFS/JrPbGvbrSRDbLMVZm4MtBpZCC9rqtHX2lll5n9vonTI6Of3YjWOaRC0UeedDNGth
         O3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510695; x=1779115495;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FU31spM6LjzcyHuFHmDris1Hu7nsA7C7uZ0OzEouoRE=;
        b=oROLdYlYfwyvtQJt96E4hPCO2TVaCggNaSpZsOSSCgSPh+WZIJjtytRLVXTAKkUvpA
         YcYnwSSKXOwXdw2SfsD4RrPn4gtMTps7ABDF7rAZT8uv3vK7L0+nqFg5pQ4yT+VzThKT
         b8Y4z+RN4C2dRLTx7KB6P2mdtD8vDL5utIl+4QgodZ/92ChiHMhBBpa3LtQegyOv+RZW
         lzmBTvJDiu65LC66NgnWcD+Eaxgmm9+WCN8xXDZjh20/hM4LJnQr8LTcXcjvEg9W2Zgv
         MLrRo8rYUVgEih/jffrZn17gvjX73J47P5U94ry0B3IBp5oTHi3T5j+L/beZk9rBva53
         oUCA==
X-Forwarded-Encrypted: i=1; AFNElJ//lr0yCzn0LDdUyWonY/AiCT+YA4dJTI20LuepDJfbYBy52r/S5w4RNcKWiZgz50ajSZfSsZ6DCoHsUJggpOtilw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzR5rmtfFj1WYbiAt2J4gELv+VoNVwBYk2JtVOlZLMBlbwqjsQ1
	i1Fci0Zvd3QZGROIr9FkLrLicLjjhn58xgV54AQKJ/Tmri5g4sYlvlsnRdQw1ULqYgWFVrIZVGb
	tXhnP1VYRtCQK7/0kjEn9qSX0n0FCIL3MhfCFf4Z7+Jh23dCbrwA3nu9iwzSpi60kNtkfRbya
X-Gm-Gg: Acq92OFLkfZjB1cBZfDb8TVvkOfnPu9V8frLKv8dKWHersKbjM+e87LdMCat9CLJEWd
	Hkm9gSzgwvWO2LY5+JFd266s+Bv0tQVazV45YFf3WeeODnG7W/KnVoqLzWbYr9W4P0uCNb9cL82
	oH5lc0ThKNw52UL4cApqzzIVoqh4ojfrNtmbOWCzNbRgLt8fdB8bVBGDihs/6v7MUAFAAD7gVxJ
	u8AezgbLvm0q8BL31y6Hemrej7B0ysihhajH6QkllSWd3HT+b3lwi9rDBmyxXn1WLvhq8kHfo+2
	wJ7fMW5P8xGholEAocEug2REbw6FCTGX5XwSYygKrjEK0g3HeL0eiMFZY8ZtsWtAuWKKcalK08a
	2kxdZyneBbyE+479L3gkYIQ3kIAb2dQZga4tYe6rruOSIkBWMq8451Tvp
X-Received: by 2002:a05:622a:550e:b0:50d:6b06:a453 with SMTP id d75a77b69052e-51461e4fdcfmr344798811cf.18.1778510694817;
        Mon, 11 May 2026 07:44:54 -0700 (PDT)
X-Received: by 2002:a05:622a:550e:b0:50d:6b06:a453 with SMTP id d75a77b69052e-51461e4fdcfmr344798201cf.18.1778510694263;
        Mon, 11 May 2026 07:44:54 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf39c82420sm105737256d6.33.2026.05.11.07.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:44:53 -0700 (PDT)
Date: Mon, 11 May 2026 10:44:51 -0400
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
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 03/15] clk: scmi: Use new determine_rate clock
 operation
Message-ID: <agHrY52NvBCWA2fi@redhat.com>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
 <20260508153300.2224715-4-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508153300.2224715-4-cristian.marussi@arm.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Rspamd-Queue-Id: A9FCC510928
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com,baylibre.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-32390-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 04:32:48PM +0100, Cristian Marussi wrote:
> Use the Clock protocol layer determine_rate logic to calculate the closest
> rate that can be supported by a specific clock.
> 
> No functional change.
> 
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


