Return-Path: <linux-renesas-soc+bounces-28885-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNssOfJ/qWkd9gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28885-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 14:06:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B58A21263D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 14:06:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E13B30B0196
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 13:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0119E3A0EBF;
	Thu,  5 Mar 2026 13:01:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7373639C62F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Mar 2026 13:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772715713; cv=none; b=MpDZrrmUbcCVCcEhwA0FoTMpX1PXEVs2GGOPkHMQEfrPOi1MZOICCE7leayJUeNWdQR2EePO2xG8ZJao3iFBc2ljdMKu8/+stnhbyFO22TYgyJGKp2oIJ2r9rSxnEz931T1reYfp/BLCJbi/8sad04e3qCJLIjoUyw7b/xm52Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772715713; c=relaxed/simple;
	bh=mzxuHFEBJ8rIbeR5gmZexUBLMULkEpRVqRmwwCFyU/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SdXfxmNg5b3UesVlPAvwn18zFUYQ5l1HPFeEbB/eCEkZYWA92Hu7BemczR8n1KQ/AUGevbJuVRyeqLHoPG/Pxa8VPEy9J3JqIgNj7SI41QpXWn4eWryIGhp7MBxsdycUQv5jwI8gFBJv5yQahqShyxs1WCoyUC/+D3VENxCV8ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ae43042ea7so53424925ad.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 05:01:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772715712; x=1773320512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IxpxVkGnClS/pzWnTPcTEx+bl+pPZR21vGpLksfVXc=;
        b=EoPZpIHrqHIk6le1HhFwDTZqOA+59+qRu76yWMEmIUh2qnoF9uu6TYBKccsU7Jr4W7
         JKuMcA33hWTIOFw4bRLmbCRlnSz/cuSd6dfqajANb0FmGWN1PNAYMBKpTaho9T5M/hdW
         GYJx8SwE4k9g5H07kQclAOPAk1HxSz0D8p52oMSuYXG7AhgCyeTlYnJ3dKmiVMNSrW6F
         USi0o6aLfm6CnWnLb/0Kzd2D55eI/Q+iJVW/vaVr8kK0/LAIHuNpAvASAXh2MkuUVg5J
         rcOj7ssYvwbVZfjS+j6i6PHDjsBi9ayXgUUJN51o0MMBquxWfMH6MdqclbalbKOnnhl/
         Bh8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1QmR1V1QvlFf6gmTbNFbJ1O0yWHV2Ryw4yz+V12jUpyhHgbhWRB3ZDH4PsUbJoroIHEurdWex/1W04aFA0voilg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0s02nFWrxzYO3OpXSlN5w/F5OzXZIQ0YymSIlAX6ILHsVtket
	fm6VroQuJIjqupZsCq8wF/tlgAoa7lu6xJUhn626aCajvDqEpnHXeGdo
X-Gm-Gg: ATEYQzwb8W7Zk1cqoc4ahOPjhlp4FhXdOPkM2/0YUDqDSixsX2nPV9XKRlJjf6tLWmD
	nrTZi073J3eSODKmx9e/kO33MbGY3/ONEPd9tfSZ+JKHUAVdRMvDZihySXBz61nRqaBBRAp5aUR
	OaeqedzAoyP89riCo7B6HGVcYiFg1V0VEMYiTNhiFB8RHrDkoOK+BHyOAXOvm6xdF7GJdJDGKEL
	Pz/GPmA2UFGO/oLSYzqcj8973WTEbH907M32myURvuuPOmHpqgqwJVrUsZps712hro4SLLXI053
	INUK9HHCnFgu1rhDCYqhp9XXAXinFIpDeFg4j3nq3henlmyJ4LSqtNfyKTyOlPtploHupVng8ff
	lzKu48Bn+jEB5BwgACZWj9Jzn+/hgDOjOpefYuE/P9albPjp+K+f7MzBfW+8wBJKnHqHYsPAghJ
	iDhi7Qbkv9kFiXC6bgwhmuSVBHIuefOQy2l7BHhLSDJAuWzFBXO3LErLm7LlTTT55FHu9qKImS2
	QDS1IkLSyqeSryiwY+u1PU88gFQltpRjcthoJZRk8Kn//1CwR4HIddP3qF3WQ==
X-Received: by 2002:a17:902:ce03:b0:2ae:5b52:3818 with SMTP id d9443c01a7336-2ae6a9deb2amr60551085ad.8.1772715711782;
        Thu, 05 Mar 2026 05:01:51 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae54136b28sm115696425ad.73.2026.03.05.05.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:01:50 -0800 (PST)
Date: Thu, 5 Mar 2026 22:01:49 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
	Joe Perches <joe@perches.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305130149.GA1659133@rocinante>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
 <20260305121532.GA1649635@rocinante>
 <20260305122957.GA1652563@rocinante>
 <20260305123956.ojkt4k3ly64xz7fu@skbuf>
 <aal6kWDx_3XRGB4K@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aal6kWDx_3XRGB4K@shell.armlinux.org.uk>
X-Rspamd-Queue-Id: 6B58A21263D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linux.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28885-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kw@linux.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello,

> > > For content match, it could also be:
> > > 
> > >   K:    phy
> > > 
> > > I believe this would match everything of interest?
> > 
> > Yeah, and way more. Think USB PHY, network PHY, etc. Don't want to drown
> > the linux-phy mailing list in unrelated patches, either.
> 
> Also phylink, any memory management / DMA stuff that happens to mention
> "physical", and probably numerous other examples.

Makes sense!  Sorry for the commotion here, then. :)

	Krzysztof

