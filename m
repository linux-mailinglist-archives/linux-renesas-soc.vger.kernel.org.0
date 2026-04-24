Return-Path: <linux-renesas-soc+bounces-31628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BQoNEJd62lGLwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 14:08:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA1645E2F7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 14:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3824F300F94E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 12:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFDD3C140D;
	Fri, 24 Apr 2026 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="GNjp24LT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B431D6BB;
	Fri, 24 Apr 2026 12:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777032511; cv=pass; b=XRgHUDK30GVQ1AnY1/eq68s+b95ek2hbsDriCevUICor31ae3AoLLhNDkCKxPjX/3gg8OYwSLPaNcFDxiPp+yq1u1gqzWjRlUNPBOviKqverDPJDbhAAil5xB7QJddqoClrutJSGbYubmFZjB+5IwdopsZd+HjI4btsObgInv4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777032511; c=relaxed/simple;
	bh=zlUGO38FPiyQvD9ieoSKSc911j6QvX1BTq5ikOqzFZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oPQJfdDQ7iSCe0H84zX2FPx9Ey7lcOjZiKKyCujZBkR6wCA51ymRTDul6X2KVkf8jrDZkI2Vf5ojqTbohOfZ8CXvJpzGBrndQsFvjcerZj4ZW+i1lhCDlIPO+Gl9/RO2/RN7qTww/JdsLAF+xAfgLYukyBvEWkF49or7/RSE8XI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=GNjp24LT; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1777032487; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HXNAqMyoHqMgojwx6MnSPNk+yj4GSKW7Qn83OGawyK+hTs3JO0eL+PoijG73hKgQLLVJeMVJ3QSNtR//RCwJNcx+sJxAZk2E8JWMOSDdi6CV7MjafiBiAo8btLABSx1cARDKtbJaRyLVby/3cADoDoYOdQUXGiwtf8K1zaQUvDY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777032487; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eFoNQkR4m6ISqcP4PxzgHhBXbH5/ARCp3z5MOkbHYek=; 
	b=gmeNvQ9vTiST3jlKgMWx5sbT0O2IlcJF+XMlcqiijASRHoR7EiMnq+YxJop8AzGxbgMQP+7CAqGIkCtJyU81en0g+r+FbJJotCdfMkzMthsmYmmMJXkTtU8NlZGQmSbQ/EK/04GEzlugsDOI57xVIvVJvWcec64wrXoNGL7m/kI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777032486;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=eFoNQkR4m6ISqcP4PxzgHhBXbH5/ARCp3z5MOkbHYek=;
	b=GNjp24LTPgImMeeRy9ecSwNznTfZzqE0PBV40tgjM9DgNaleLQMsytVbXmci0k6K
	OQZBY2eIVgIOhF3g1Cy8As2FqCV+XIhVwxvvE4PYFHXyyYo9Il+jjcqqiTPLciUBLem
	pD/+780Rmjwb8L1lBrA1xCFI2yHk6hZuttzqvOgU=
Received: by mx.zohomail.com with SMTPS id 1777032485578973.2634566723241;
	Fri, 24 Apr 2026 05:08:05 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: sudeep.holla@arm.com, philip.radford@arm.com, james.quinlan@broadcom.com,
 f.fainelli@gmail.com, vincent.guittot@linaro.org,
 etienne.carriere@foss.st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
 dan.carpenter@linaro.org, geert+renesas@glider.be,
 kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
 Cristian Marussi <cristian.marussi@arm.com>
Subject:
 Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol initialization
Date: Fri, 24 Apr 2026 14:07:59 +0200
Message-ID: <WNCeTzosRbKm_zGsbSPx8w@collabora.com>
In-Reply-To: <20260310184030.3669330-9-cristian.marussi@arm.com>
References:
 <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: 3EA1645E2F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	CTE_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-31628-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:mid]

On Tuesday, 10 March 2026 19:40:25 Central European Summer Time Cristian Marussi wrote:
> Add proper error handling on failure to enumerate clocks features or
> rates.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
>  drivers/firmware/arm_scmi/clock.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> index c9b62edce4fd..bf956305a8fe 100644
> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c
> @@ -402,10 +402,16 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
>  		    SUPPORTS_RATE_CHANGE_REQUESTED_NOTIF(attributes))
>  			clk->rate_change_requested_notifications = true;
>  		if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
> -			if (SUPPORTS_PARENT_CLOCK(attributes))
> -				scmi_clock_possible_parents(ph, clk_id, cinfo);
> -			if (SUPPORTS_GET_PERMISSIONS(attributes))
> -				scmi_clock_get_permissions(ph, clk_id, clk);
> +			if (SUPPORTS_PARENT_CLOCK(attributes)) {
> +				ret = scmi_clock_possible_parents(ph, clk_id, cinfo);
> +				if (ret)
> +					return ret;
> +			}
> +			if (SUPPORTS_GET_PERMISSIONS(attributes)) {
> +				ret = scmi_clock_get_permissions(ph, clk_id, clk);
> +				if (ret)
> +					return ret;
> +			}
>  			if (SUPPORTS_EXTENDED_CONFIG(attributes))
>  				clk->extended_config = true;
>  		}
> @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
>  	for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
>  		cinfo->clkds[clkid].id = clkid;
>  		ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> -		if (!ret)
> -			scmi_clock_describe_rates_get(ph, clkid, cinfo);
> +		if (ret)
> +			return ret;
> +
> +		ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
> 

I see that a quirk is being added for this, but I thought I should chime
in with my opinion for future approaches in this direction.

I don't see how this hardens anything. All this does is break platforms
that were previously working by returning early. At most, this should
be a warning (as in not WARN but pr_warn/dev_warn/...). If firmware
returns nonsense, a clock driver should imho try its best to work
around the nonsense in a safe way, because the alternative is that
a major part of the system (and thus likely the entire system) no
longer works. It's basically the same reason why we avoid BUG(): sure,
you prevented a problem, but you tore down the entire system to tell
the user about it.

Kind regards,
Nicolas Frattaroli



