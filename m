Return-Path: <linux-renesas-soc+bounces-30748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eG7ENvtszmmpngYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 15:19:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1D53898DB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 15:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C17133106F39
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 13:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8684F26A1B9;
	Thu,  2 Apr 2026 13:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="axssw0zo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BO9DE3m3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529DC279DB1
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2026 13:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135199; cv=none; b=LK3xoCAH2dsplR94+xEL2yctMDYlsgtD0wTV6igV0lnaAGrQ7M8+QvkFZ2QO7Y+YIXUfj2JoRiUv9eu+Xh41c4PPckK3NBY9Yt/dHnqT2EEyI7LxZYRKibWNu/l1rjxDynLosuMzzgdvn2QpH67/zMRUYaPRcmlTTuxIL/45pEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135199; c=relaxed/simple;
	bh=fLISTcpkq3vlQbd3myrhqO+dyl+JVGQYoiohUrWpfMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g/AYGmcNg2FedVJnFKI+fh8DALls5w1wYzUTv+YmfyJSsH60kruqEyJP2b89fpkr6AmVwQVyVD8I2IODZOaOnNvG9505WhIbfrngvtfRm11KrcbSmEp7IvKCCO0zfrlSdQBU50sgvxk9vv2aJbK3yw/6jDG2LmotwP2c0PKSQwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=axssw0zo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BO9DE3m3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775135192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ZfYOudIChwa/S+tLKsP2bUZS1mOOgqBWmRnN94V3MM=;
	b=axssw0zofd6L7EZLhFMT95cLA06DMDrzXu9k8s35jxRpIaypRujipN7jY+sobCDD3dWBFH
	Ct/OHMEvtp3Ani78sRmO9Kgu6f5c9NLzizTAbrlv4aRolvlK96UnZU8ZsB42QBoFVtqar7
	686+d/cpy8pr8Yg0Hm02hJ3NVPKhpk0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-fessv545OsOTUQZsj7l1qg-1; Thu, 02 Apr 2026 09:06:30 -0400
X-MC-Unique: fessv545OsOTUQZsj7l1qg-1
X-Mimecast-MFC-AGG-ID: fessv545OsOTUQZsj7l1qg_1775135190
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4888230f434so5897355e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Apr 2026 06:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775135189; x=1775739989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ZfYOudIChwa/S+tLKsP2bUZS1mOOgqBWmRnN94V3MM=;
        b=BO9DE3m3rGbOkzMWrLE3k1pSA1i8/UA4q02JgUJ8T5aZQTIUumwyvAa2cTGiHpi7IC
         Uvue0usgIBlgqdS9Nv2KyWT5WBjba8oKrrZk6vegWIhCW+g6hwWRp6icR532l2CJOMFP
         tbGYTJIoHRum9QXvCwH58NCq5S1JfA3ZtgUXspBeVgtXtk70sWcBW2/rk+NYINfgBPlH
         YEwt6CauWm12qij3ZuEgXu9vy/rypkuGRvzj4zl0DBt0u5wx3uiI+m/ze+WmiP45PBRw
         1whCOQI4AnL8TnoJuwrq9I1lwiJ8cyOvyJFoIaObNMunsz9BadLXsEPZlu95UYRllmLO
         mFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775135189; x=1775739989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ZfYOudIChwa/S+tLKsP2bUZS1mOOgqBWmRnN94V3MM=;
        b=I+6ptYQsOyhYITOXcOiS8wyIubHAYQg8qlURN92CDiLpZi7TnrtRm5KZC+zapHF06u
         Ep8m3tz26gna3NkumBZ/zoz910kOItBv+OEj5L6juVlWRGFyTqpyUuZY1iiLeJrqZ7zb
         ANr1b2oDiezNJROEDITcdETDzQ7cHCezg38EorucQaVT9Dg0ntAcoTmLB5Ct4U+WlVZz
         sgtMBnYMjZXwuraY5F2U1aQF7c6IvFwjy/4KeDe/hXhoVJO40ALslSPNPWoBZqN6dF2g
         KprvREYL1jx8Sy+a5zGbPsOQkriyS9Il0LF4aMf8+P0K/4fv9aEFrthPgh3j1+h4LNCO
         qsdw==
X-Forwarded-Encrypted: i=1; AJvYcCVsz/6p+X6fnTQfb3njQC/rjh2N2tOz/WUGO/xPhula/64E0Df+GcQ/QaBcZAn9QqhKc+fLBW2ryGZIoclEt6rqBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcrNGhYqTeAd8g0+0RphYqNEL/Kgsd6zlKx6877VNSQ1AHT/P4
	l3rtTCI+6aazErv2DWFS7jm1BM+5FPITgB/09P4A4axScku4EAD0jLmr0RV4WIatQw0taGdQmke
	g6WIm6jkZMkxbvuw7CD3HUtHr0CsDEXDryuK70GP9JEcMLH7m+IJKksY+u+x0U9/XyBeewquq
X-Gm-Gg: ATEYQzxw4kqtbBVPEgWRVUkwvwzQ3LdPP3ETtgULlPQk4d6pGenMVfIni/1NBHWdU4b
	je8sPbzcDVwsHj0MkKsjcxoWZpKjZl/MJ+wB453NA4ukSyCKiHxHleGxZLfqiDAyGEknkgxuobZ
	n0AWegg+nMyLJfZnOQetABn82SfOy7UoxX9O5zWFBja299o7TAtAJPUxEtVRMHT/WA4xuHM5anP
	O1MEKOeEgO3fUOoqwoSFQ/cl0n56/tieeAYKcTBgj+z2IN8KjCIy/VLyNvqjblRymd2RjwEqivu
	pwLNbnZ3xKPnOPIhkaP99Iq3fqFt8GYm8K3PO2UHAwXH9bp2r2fsrBsOgcL+w2cO7IlQAGhJk2S
	QgE1Wzw5u7GdLHp4EgQb+o40kD3ltthM5B8DYNN7kfaMS2YWTy5HA6rrSXQ==
X-Received: by 2002:a05:600c:3508:b0:488:95d0:ee46 with SMTP id 5b1f17b1804b1-48895d0ef40mr7906315e9.19.1775135189415;
        Thu, 02 Apr 2026 06:06:29 -0700 (PDT)
X-Received: by 2002:a05:600c:3508:b0:488:95d0:ee46 with SMTP id 5b1f17b1804b1-48895d0ef40mr7905695e9.19.1775135188911;
        Thu, 02 Apr 2026 06:06:28 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.153.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5016sm8306210f8f.33.2026.04.02.06.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 06:06:28 -0700 (PDT)
Message-ID: <09e99e68-f7b1-415d-b1ed-efe632432222@redhat.com>
Date: Thu, 2 Apr 2026 15:06:27 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 12/13] net: renesas: rswitch: add handler for
 FDB notification
To: Michael Dege <michael.dege@renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Paul Barker <paul@pbarker.dev>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260331-rswitch_add_vlans-v3-0-c37f41b1c556@renesas.com>
 <20260331-rswitch_add_vlans-v3-12-c37f41b1c556@renesas.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260331-rswitch_add_vlans-v3-12-c37f41b1c556@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30748-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4E1D53898DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 12:04 PM, Michael Dege wrote:
> +/* called under rcu_read_lock() */
> +static int rswitch_switchdev_event(struct notifier_block *nb,
> +				   unsigned long event,
> +				   void *ptr)
> +{
> +	struct net_device *ndev = switchdev_notifier_info_to_dev(ptr);
> +	struct rswitch_switchdev_event_work *switchdev_work;
> +	struct switchdev_notifier_fdb_info *fdb_info;
> +	struct switchdev_notifier_info *info = ptr;
> +	struct rswitch_private *priv;
> +	int err;
> +
> +	priv = container_of(nb, struct rswitch_private, rswitch_switchdev_nb);
> +
> +	switch (event) {
> +	case SWITCHDEV_FDB_ADD_TO_DEVICE:
> +		fallthrough;
> +	case SWITCHDEV_FDB_DEL_TO_DEVICE:
> +		switchdev_work = kzalloc(sizeof(*switchdev_work), GFP_ATOMIC);
> +
> +		if (!switchdev_work)
> +			return NOTIFY_BAD;
> +
> +		switchdev_work->ndev = info->dev;
> +		switchdev_work->priv = priv;
> +		switchdev_work->event = event;
> +
> +		fdb_info = container_of(info,
> +					struct switchdev_notifier_fdb_info,
> +					info);
> +
> +		INIT_WORK(&switchdev_work->work, rswitch_switchdev_bridge_fdb_event_work);
> +
> +		memcpy(&switchdev_work->fdb_info, ptr, sizeof(switchdev_work->fdb_info));
> +
> +		switchdev_work->fdb_info.addr = kzalloc(ETH_ALEN, GFP_ATOMIC);
> +		if (!switchdev_work->fdb_info.addr)
> +			goto err_addr_alloc;
> +
> +		ether_addr_copy((u8 *)switchdev_work->fdb_info.addr,
> +				fdb_info->addr);
> +		dev_hold(ndev);

Please switch to netdev_hold()/netdev_put(), providing a suitable
netdevice_tracker.

/P


