Return-Path: <linux-renesas-soc+bounces-29712-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jdH3KMEuummASgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29712-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 05:49:05 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B272B5CDE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 05:49:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 01A3B3017DFB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 04:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471802206A7;
	Wed, 18 Mar 2026 04:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEETt0hu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF2119D08F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 04:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773809340; cv=none; b=qtiHkDUR/OiEb2igJ/B9QN8ENJ8kMUL5ch2f+ZMCmOBFS0yVb676i8nF1XzNysIa/qPUDRBj+Kps7gf4pixH12Iu71UFstzkhSi4ZSoMyI39JmMoMEQJfa1qJ4o/oWt8aEju+y6jqde490D+0TWmotpJjd4v4QmkqRoMxGq+q40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773809340; c=relaxed/simple;
	bh=17iPzKkUJzPn4E61UcR7m/teEZK5kJ3beqSFLOUuoD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rru+Aj/1vId7Y0w7AFbTBW8X16Ey+Y3xlCwEOfA/a4U7ydCJTkKupJla03XGTaSVci/aggaX+tjV7jRWq4frJWo7xAG/Z2T1uGtBZLDRXz/d5TGPi/w8l+A2rqteq4RT1S5g4roIPxvbdrBKrofIQxmTnCbaRS4rEAD7JrmNmfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEETt0hu; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso7747903eec.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 21:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773809338; x=1774414138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ejLjWRAwoEU5o80iQ+QQ21HclzxMPuHPja9YvmCRZw=;
        b=EEETt0huR+WR1z3OUWA2WqupaidOBI/4vf+bNW4OsgxgIChImYMLJhVKUBg6JVLqVl
         CU/NB3qhdLFt5bqYfjSeg1kKfgkXhbauXbsF3QF1MGJycX0EPUBYlp7rfcAHgYjngcD+
         A6912ib5mRN5+zndexEix63FZrxpuflz0+W2xLdWNuOE5hGwXwRh+A+w/3Ml7E6LIRWG
         NDdeQ9rrfttyzhltN8mKi32LrVAYRydHj8l8CXFo2ymyVBAP04VYBw5qw1oY5xnoXmll
         nTMfg+aHEhtXz0VAhJXEIlaZClM0G2/f0GVjFgFHIYT8KgqsJDJNMNtyaQEA3j0QBFS7
         LWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773809338; x=1774414138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ejLjWRAwoEU5o80iQ+QQ21HclzxMPuHPja9YvmCRZw=;
        b=n/sGAbEvGvrCazcrn5Cu0Xj7DCgkuELeWZbvlpB36zyhcgD/p1KXzwduT9uTRtYRq6
         0Sfmqa33hPCZ69LghmWnyMNQc3kCrr+PGdwiLbKJF4qnQf5S+htF2ic0Mcv1Zk73GoJh
         j6/HzMx121vS3I3PA4n9R/rhgRJP2NJwyBa38Zghs4ub9l7FeDzgWlg6MrIGeobwLvmm
         Etqhewj9RyvE7YtxvbVqmpMhCNClt1YgMfugB8rbzlhLLpgn6ic6OFopmpoJl48TXLEm
         fnk3+25px+97WbNYwiJrbJGRwDWbtq6U2hD41PMQBvimDZQYODAerYo0visrnCxV/B7O
         2ZSw==
X-Forwarded-Encrypted: i=1; AJvYcCX7NEDJa1jnqznDYx98zmQfzAbPvvRoChwUYexnI8ulv/e/+moNgu0bLWoPHtoThUA/SOl32eFG58DPZmjXB2WFPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTBoL6dRJHqVZV/DE6E9Ek/UYGaRiy77ltHOLGqsdn3eaOczj2
	1Bdm+P3tF2nTKKrxqzilWmoX++zGJ0Ley5L38hPtEVKCfPxfhBKNM7xW
X-Gm-Gg: ATEYQzzyomYi89oqxlvJwiTor9ClMfWXmAU6xbMrxkpIk4Fh8cd3npUyfs7b/o+ZBrt
	3gvbxNnXkVQ6b/dnNR1Ot+DbQxZfIGo1JDJV3PkuqhFX9//m8ZsLDRqCqz2Vp1PIx0yNzu+/GaT
	7AdUbzYHn2G5EDsco4YYW3c4UG3K8AFWHuE3hG+LZfsGxt8Z+fsbBRca+S6g8j/rh8T8WKQqJZe
	HkGeuwA5oMj/TKswnpo4mBxS0/wS00ojDuFAVay2LOiCoZ/bvWz3K7plRDNCIkESyUo/SpVsiRw
	xmculBLXIgbaUqDH1q7wjA6zOKaCw0AQ0/bsGlYn/rcQ9VA2UW94bHUPbh98gSdaZRzC+6HFJ8W
	zn86i7qax28cnHCIzLEKJttmLf2MtEExvFI0Ud5633Eey6xT8v5LF6yWAB3zkCPb/F9HuO9CrXG
	UJrCxkwvM724mHPetJzjbYoQHPao+jeoOWArNQ
X-Received: by 2002:a05:7300:320b:b0:2be:171c:5048 with SMTP id 5a478bee46e88-2c0e5074af8mr957700eec.5.1773809337736;
        Tue, 17 Mar 2026 21:48:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e560fb5fsm2902735eec.31.2026.03.17.21.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 21:48:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 17 Mar 2026 21:48:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Dawei Liu <dawei.liu.jy@renesas.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, grant.peltier.jg@renesas.com,
	linda.xin.jg@renesas.com, tabreztalks@gmail.com
Subject: Re: [PATCH v2 1/3] hwmon: (pmbus/isl68137) Remove unused enum chips
Message-ID: <2f1347a9-4284-463e-8ca4-abaced830468@roeck-us.net>
References: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-2-dawei.liu.jy@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318021921.75-2-dawei.liu.jy@renesas.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-29712-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,roeck-us.net:mid]
X-Rspamd-Queue-Id: 16B272B5CDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 10:19:19AM +0800, Dawei Liu wrote:
> The enum chips is not used anywhere in the driver. Device matching
> relies on the variants enum instead. Remove it to clean up the code.
> 
> Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>

Applied.

Thanks,
Guenter

