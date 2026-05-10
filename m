Return-Path: <linux-renesas-soc+bounces-32312-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPRkOzJDAGqcFQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32312-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 10:34:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 051E75031E9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 10:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A260D30028ED
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 08:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0DD36A009;
	Sun, 10 May 2026 08:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1sX+HyD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2583612EE
	for <linux-renesas-soc@vger.kernel.org>; Sun, 10 May 2026 08:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402092; cv=pass; b=cpDDCgBXV+0C0TGeLqBQ0NHZx27kyznn15XaMuO+CDfNQRchYFAp2RXIrE102uzdrPTmy329b9UqqIG9nyPkB3U5buob3O+58Ev869RRnkg8EX9BM//hWnxHs73Y7pHta+laPxWgUVVow1DXuA8CYh0TM/KNP0XCGzdqARiM5HY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402092; c=relaxed/simple;
	bh=02l/NBVcMEYBtBRSG2GVWGs5GL3pWUdRLnFNE/9StO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XbGmlcm71K95ROAynadwWptz2RAswHM7twF24IpCR7VrfVhrGD0WIkpRZ77UTiqeTH/mfLlPOvvmqsJ/T0LOnh2Q8yiF3hlNM5vsd2iKoMtRwfUtoZy7THTHUaXRyjNk/zcL6eqFubbbHovEVInKW/S/yUqMCRToeYBR4O+76Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1sX+HyD; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bc85eda6b6so2923115ad.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 May 2026 01:34:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778402091; cv=none;
        d=google.com; s=arc-20240605;
        b=EuMuBTXrafRCjpBQYMCXUBPapzoWdmzTHh/BxWahkxzqoIezyVyfOj0zoEDGgA1YsI
         rj825vgk2GhLTF9A99FIJeAhU51T7WdNWMMiGqhdo3r8PP5gZrVosnPzXWFwuTnCis6b
         Mohk3HeFJlfO6/cp9JIC+7efkijmQsy8OYR6uOiApDXVvdJpeQOK0+JonuY4+hB4TL/Q
         vvD9coxxzm4lkrkZMOSA29pP/AtYHdNlefDXlPMJBMr31XdnMnM1qCbPLduvG9xGqn4J
         lNL9O6NKKYoN3753n5tsL3anVnb9ZPxwX2PeuVE4Y8J4hN1025Y6xn6H9t2HlgBObog5
         iQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=02l/NBVcMEYBtBRSG2GVWGs5GL3pWUdRLnFNE/9StO4=;
        fh=IgTFaj+Q54a3tDJ6MBgfi4CtLRmQNvym09+Ku8Czrl8=;
        b=SKGejCZhGa3TBG18nFiSAHXz8HdWfwbylxVXO/DCsmHzWMrdhE2/cIOD8k8YF1aS16
         zSIyg4wVeidglos4XzaB0c2aZ1wxUv0iAReExKPMfJPyLsy43wa+WfKqRZ+m5cbNH+QW
         n4aiHjnrhen1CYx3ZfCP57Mn9JvJjSNsxsuQJe6ago5t3DZM8/J5DyMoVs3zfllqqKhe
         LDXCiyICVX79IFpzVI4Ax+PfH2/13AI1FUkGRgAYzXEKQXBKZuJyY27K+d3Dh8FTegF6
         1JzfAtPyq4mgz7hdWxzSO0W2P8IRT9bqA2UbYfqiggl+0lctr8VXAkaWnLk9VkC0RXZN
         ecng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402091; x=1779006891; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=02l/NBVcMEYBtBRSG2GVWGs5GL3pWUdRLnFNE/9StO4=;
        b=C1sX+HyDQAgmMdNHjY3sIz4GOi7WJ2B4jFhkkVU1shNs2RfqrfDUgtJTTn5QX5BnD3
         NexD3QBMcE3ITVD0DHdDj14tufdA2K3nZUu3ljoHkLoObZvQctgbLOJimlvAzRnmRknY
         cFUeMS0+rZxMC5P2FvyqKykCJjO0Q8aiWxkYYEvXvwhEIkKq2TsfpCnRH96aQig94L6k
         oAqCKQyS02BMnTzxHZwfbsgTyQvOFwmlpsGEUODFDvpP7Auw0Yx8oiAEPn4KzBevBll+
         iyInjt0H2+PWUEdn2cVEA3qBbRrtdiC94x5kpuofPaDJbn0V+iITSwxnSWoggGGdB62k
         HslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402091; x=1779006891;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02l/NBVcMEYBtBRSG2GVWGs5GL3pWUdRLnFNE/9StO4=;
        b=WokOisqIZI83k57bYvByjY6WRC1fHvQkgZ2GjkjNMP65nu1xJ0QvyFKeSgZNg9pw4V
         ihMLyIHuVBPhzSLq5GMiAKJ1VohaJnyH0Io6Pv4zusf4mFebTpNacbizTysbmohNQBy3
         vbIohoLA7L2msnWZGUm60Pvf0ydHTLKdxuFYIi1JHZLcZXIRhbCahP+WtukXbmpdo7WW
         HKF596ZOv/VWJEXVNyjUURUVclo5GXe6mXeNVweeR98D4PHSLiZsTRhKMHTzPYtIanrA
         h5cBVvss9WLJzWx1dyglcLMeukAnv6cZ5kHcIvC4bGTdYB7xpPToJxqOublPa6qkCuvH
         J0+g==
X-Forwarded-Encrypted: i=1; AFNElJ+0ZGU72E35Zb/lshJjxiWhFPkMzUpbMbVShjfHJ2A+timsuc6J+D1xE0/nTKYTSVzJpnCRFXsOUWZq/IqG3o2ZQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfVzVqxqXXRlxwJ632oN6tn7VGm0fra92qij3rDYb6cU2+ou7C
	hZwPZsZ2gJLVvp1IW1EHg3OPAV/vXLUK2nikFZ3lk7+1nxBi6DZVz2MjhVyyokJzegzLc9pi23Q
	OcsCreAb6nvT7Cxfk322uRwZQoDxhhpM=
X-Gm-Gg: Acq92OFcbtiBMWVKL+LpjJ/4QAP8+xmfYsu0cDFVxG6v/XdWcfFuO2/114lG/rYhjzq
	B4bNIBxnVfI5DO3aUIrql1C4yBY4FmHiuBWbk5FyVUG8jC26EkttmEYTa0cvrouQvafSMwBwQrX
	SCmM00QAUwhoOzvbvulvuN7tUZ64iLwRIm3xnUz7OJc+eir1LzK5wjHUHobMxUSCDPk/v1xyVVb
	MmkGca7EAnK6+5nhJquBFhzLDrBucOtUs4/ohKFtX3of6HuYeUMmNrFgPpIy0JDMgQ37zVrN6hB
	RIRE8ixSGCGDM3JWEuCT893Qw+F9hh9d4jcNqw==
X-Received: by 2002:a17:902:e547:b0:2b2:b117:1d5d with SMTP id
 d9443c01a7336-2baf0e4fedcmr101160115ad.33.1778402090680; Sun, 10 May 2026
 01:34:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-4-phucduc.bui@gmail.com>
 <87se8ypeq1.wl-kuninori.morimoto.gx@renesas.com> <CAABR9nGB0u-Y7ddGtu0DmZXUiEWTVrXQy7DhTkLgkSBvFjNyJA@mail.gmail.com>
 <CAABR9nHiSxH60ULks7_jZCC5rE+YVu-u+nm3TnO7oKcFoQduhQ@mail.gmail.com> <CAABR9nHiaw_3E3=id8d5GW3t9XBR7c2WrYU8Hsto=F0siVa-KA@mail.gmail.com>
In-Reply-To: <CAABR9nHiaw_3E3=id8d5GW3t9XBR7c2WrYU8Hsto=F0siVa-KA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sun, 10 May 2026 15:34:39 +0700
X-Gm-Features: AVHnY4JtIFjXEfpi29lPaktBvsTRJzvsyk6zoeOhoHMm2kGF0XKoWYVx8WWmEro
Message-ID: <CAABR9nFw8RL8_emWR3qNLmoG-hmkHAgoEBP+4odN2kSyTSmtug@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] ASoC: renesas: fsi: Fix trigger stop ordering
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 051E75031E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32312-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Morimoto-san,

Since there are quite a few related patches, I will send v3 directly.

Regarding the optimization approach for in-flight IRQ handlers, please
feel free to provide your feedback on the v3 patch series.

I will make further adjustments in the next versions if needed.

Best Regards,

Phuc,

