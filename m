Return-Path: <linux-renesas-soc+bounces-32389-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHGPIk3tAWrTmQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32389-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 16:53:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E84835109C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 16:53:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19DB7304F2C0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 14:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5384B3FE357;
	Mon, 11 May 2026 14:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EH2XyJHy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iPHnMoLp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B6B3FB7F6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 14:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510671; cv=none; b=lq5riSTpdsGuQWKpWChIuBEPkFeQsGa/DIhWkIIGOlEcgteaZ7cQkCtXM4/PZSjZUZKScGVssVaoExfWIbqdy5sfFhyidGiOxNeai+LUWiOZ5N2Sm+YHrkZMVbsPIj7hCfFTygiYGcDEi91qcmDf+tE+A29KUzPFZYZhB8jDwJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510671; c=relaxed/simple;
	bh=YeUj9wXNgdrewjn/2kxGJgL8PSFFtIVeng7DFODP/tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBJvx+hnQxq7dg4m7kCTHZtQgA8Iqy3cTF5xvJMso3bxMg3tm4ghCTkcR6TWDeGsyt0jw/j74/5qfPYPrEWZs/rSH/sPbvzXsDW8E126CXsKawY0OrqUCSGW77SLNP+6cvuJPoQnRusNDMxrS9xdM9u+7XUy6o0K9LMMxt/R3is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EH2XyJHy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iPHnMoLp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778510667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eicqwhgs+eER0wAJIrvpo3UBssGzYDYUrthaa+7DjQ8=;
	b=EH2XyJHyB6fmzGA4HGVzb4L16axxrSiFxlExuM4EJPHDTjlcp7PDeccEw0TxHPIZB/Hb7d
	loZMh7QHPVP5doTl1ybiPLzwc+IP5NPVUmOyacyZijKO+iGYNVKBAcNQx2hRuRzvMboH7t
	kqkef/I0D0GsPitmF0Uoqo3LYYnQZqw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-MfPXFzmlO7SbG7ApcRFzRw-1; Mon, 11 May 2026 10:44:26 -0400
X-MC-Unique: MfPXFzmlO7SbG7ApcRFzRw-1
X-Mimecast-MFC-AGG-ID: MfPXFzmlO7SbG7ApcRFzRw_1778510666
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8b5ceedb5c1so103149216d6.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 07:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778510666; x=1779115466; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eicqwhgs+eER0wAJIrvpo3UBssGzYDYUrthaa+7DjQ8=;
        b=iPHnMoLpKC3JNAWBRNQE7n6c2ISTDcxzhNh3O0OTvKW100V3beNuH/vIgN9w8Oye4x
         2XNMgt8AemLtZOmgnOmEpphGqKTfJMGYwLnFo1zYcEqa3SK+biNDEOtgUazc3ucCBd9G
         bYQjdABRS2RiDCRKYYh5Y8ns4DDqc5p+sAi/W4AqVxoqX7gs00FMVBagRC4TbsnwHgN1
         ospG3YuNQL1baSpe8eiAx0jMo7EIy/nyAKIuG5bYnjK40U8+cHImn3S9/l4sMHfrkMil
         POnfoSs6Xh9lYZihmEYLf0WWm4qWJeo68sXtOP/DfVtxdGuasAzKE7pWx5U0Eymbb4rX
         H8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510666; x=1779115466;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eicqwhgs+eER0wAJIrvpo3UBssGzYDYUrthaa+7DjQ8=;
        b=Sr1rGbibFQmeGaH1BD1XXLuXnkVtQd2bCmXZIuCl07QE8f7nUTbETFW4GDvBngh/Pb
         8LXhxyLcCe3UAJCLrPubIMfio4Ie0EAToa6pMydURBiKXs51U2DifUQvcT/aThs7ptX9
         msKsjpEPNYBtsL6BcvsBD5Q7Zl8ctysQ7zagtw9YWS/9S88rrO+l2Ii3vBVL9xIG/QL+
         Rk362ZaTN072RIIbB8zaBrqk1p7lU3v6cuAwMX/F2iEZcXcY4Z4MOZkYBEtnWDzQwUGK
         NQTQjCCxbN6tJM9HS/ulfhmWSdmT/VER7/0YtCAeEZs/5dWVL1u5cuoQ3KZL0pKCsMoo
         iynQ==
X-Forwarded-Encrypted: i=1; AFNElJ9nvLWUlsVQ6k1S3QCnRA0ulukirupxaZdQ3KfMzFlz1hN06R8BPNwu9cMOuOmV0mIpWLM+06qX8Y5qNn108Ksgjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT0RtZ+HR8SrDWJgvNArfkgsQd6kii9VRcjmlOvqG2vRU8mjLI
	rGRFKUOrVdu+NVj9WcfXrTjOFz1s8AAe+c3n+R3cRbFHRTRv3N5V5z/+RFdod4d59sqMcWZpXDX
	1R8Ww7pKbQBLBcPs6Ct1yUIkk0APCLCs9z5p7Hp3mjqKu973VYGKaNOO0SwnrR9aiLYIKHVxI
X-Gm-Gg: Acq92OGiHlNEY9nYKHjcx8u1ZmE/sev/wIWHZFOicUcftuQaJsyQVb3Hvm6DxPBTIqO
	ucGJrLdxl0PTgO2K3r19kyGrEHcllgYOAwBjC0rSs3K9UJurvAKdxgYxfoAGgLj4F9gVjqMDD9G
	HNWQahlPg7Ka9H+LUNYdNDqf7QTme7te/nR0l1kfGELN0VA8elAfCdop8U4RFTGZSM1SkLC9JY/
	dg/UhrjzJd2bQWeNEPmYrEPFARq7OSHSRmkOLY38WQCMEVuDKSUUwsapUR2q6Xb14xBJw1VEIIc
	hkaPMvJCD9fPhIWr2wo8lyI2Rc5S0m+a7mZvpQ24rnrGAQ2DhfLmgimcwow+EaU0Pwqbonn24YT
	vE7GymyA51WSjFGbsN3i8OO+YWnh3dkBzwnwZp6NEqVRiPUnezyLuLNUl
X-Received: by 2002:a05:6214:242d:b0:8ae:6587:3d54 with SMTP id 6a1803df08f44-8bf4302e586mr246379936d6.26.1778510665801;
        Mon, 11 May 2026 07:44:25 -0700 (PDT)
X-Received: by 2002:a05:6214:242d:b0:8ae:6587:3d54 with SMTP id 6a1803df08f44-8bf4302e586mr246379126d6.26.1778510665344;
        Mon, 11 May 2026 07:44:25 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c6b8398sm345352276d6.37.2026.05.11.07.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:44:24 -0700 (PDT)
Date: Mon, 11 May 2026 10:44:22 -0400
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
Subject: Re: [PATCH v4 01/15] clk: scmi: Fix clock rate rounding
Message-ID: <agHrRhvz_gHLpxPr@redhat.com>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
 <20260508153300.2224715-2-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508153300.2224715-2-cristian.marussi@arm.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Rspamd-Queue-Id: E84835109C7
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
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com,baylibre.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-32389-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,arm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 04:32:46PM +0100, Cristian Marussi wrote:
> While the do_div() helper used for rounding expects its divisor argument
> to be a 32bits quantity, the currently provided divisor parameter is a
> 64bit value that, as a consequence, is silently truncated and a possible
> source of bugs.
> 
> Fix by using the proper div64_ul helper.
> 
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Fixes: 7a8655e19bdb ("clk: scmi: Fix the rounding of clock rate")
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


