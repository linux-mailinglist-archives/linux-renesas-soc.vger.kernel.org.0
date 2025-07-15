Return-Path: <linux-renesas-soc+bounces-19553-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A38B05844
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Jul 2025 13:00:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96F881A60DA0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Jul 2025 11:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04FEE24EAA7;
	Tue, 15 Jul 2025 11:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VxhJcCGB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2585B192B75
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Jul 2025 11:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752577220; cv=none; b=dlbn0d+YcX+qpAzcWmSVFcWIigozUpu6+SPvds4M/SeOOEX9cRcZ6uPc8qw4yp19Plw2Z6WuOmZEv2S9/yRm+YVWB4jwhMiiW13sZ3Go93wJlNTrxVpuElAjw1J8GReSsuGfYg4y0Opq0N7Q1Vts2AfiBtFxAs+Atstwi7b8KN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752577220; c=relaxed/simple;
	bh=VWAyEjhzHfZnqcZyzvhGGhaLq9uUeL69FOpazGDX8lQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oq1CtV0ul4Odt6503DhO7hWEXO86XWTosB/yvAbvsLNUmlcCHAA8rR8He8qe6YavxY87DedidnN0cVHVZjIh7wkWgFcJzTxP34toGXpQYxUlZQSOyFcQxWgpfycI2VDjI0Y8gkJ58QeQmtU9YSwCYF4R7P0I6vaO6GPZueLLojY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VxhJcCGB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752577218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UDYromUN4X7oqrVyCqPutBBMeduCEyx9kb+TcCXFA9w=;
	b=VxhJcCGBpeYTt0XKP1gNSHODZJW1CNCNLL0zT6qdRtG7iIPy61Q/p71ADNvCgkKWWsO/nk
	y0iz/0bIOXK4PPmhjRAJdz50BSYy+vgY/WoSUfRm883TlqP6/nmbWgy8Oxo3hoJkxWU+1X
	sQ8RLWXNwwAwUIE/gOIYBBQj+Xqm6SM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-2X0vnuuIMWyKW_04sQkRLw-1; Tue, 15 Jul 2025 07:00:16 -0400
X-MC-Unique: 2X0vnuuIMWyKW_04sQkRLw-1
X-Mimecast-MFC-AGG-ID: 2X0vnuuIMWyKW_04sQkRLw_1752577215
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451d7de4ae3so33961955e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Jul 2025 04:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752577215; x=1753182015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UDYromUN4X7oqrVyCqPutBBMeduCEyx9kb+TcCXFA9w=;
        b=QfnKXfmha8AsyDFPU5etdqEGZgFhs3Itwk/iFlkAF7h15Diu+X/mCy25xt2hIkJ+pZ
         yUx0gyan76lpCDY5uzsthziSbvHM8kG9xGGvCH7lBIZ24pindW2GJdM6sB8lu2zADoXh
         ZDNsFeech6zpyAzNpvBpQEOqAO4CPv4cADBZZj+hIFYsvRsDC84wgoeVzh4c1kYZjAVX
         ac+qfQ6nSJ5hUx7fvP/FXikrP00McWfetSx33sdSHp+w0aLskSN43fDqq49CoZ4MTWrh
         GByWqJkc4zLWFL1dy+Mcl3f9sw/HsdUHQoyidrC/O/i+fStzCc/qBnzqSvmEibGhuTmJ
         IRyw==
X-Forwarded-Encrypted: i=1; AJvYcCUtY3bXbyT1zG0OmlLKc1o5hd8mO8OnhyTlsbrtWAdgwjnWoiv7IoiqTlgHDaU2mHMMkT0/876m92BXC8i5jhQgvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPqb6v+SiA9tAhBi4JmlZbaL+2wFYK7Hg4G112XPeJ/NmH2bZK
	brxRnLeXFx+hGK7t6NtiiiVeIwDqklASeavyU4sIJMwf4V1JYlqFbQFkLvPNSnbxCpBceRV8fma
	NsLpwoBGg4cEKldOvAbKUEcOhBS2EeBngQ3KPYwxYu1YiIr/SbrGaJXseMHIPIQxZsluYF+7i
X-Gm-Gg: ASbGnct73DQF5q7J6+03cVoFIeo1UXeyDb7tnMJqzBasHjY11XhIEJMGI508+R4RHPr
	/UZMWFxyKXZKjr7mHDjz9UCZynTfwmgAnz6ROtpXVhtjzlTb6upwSbc0OMCn/vukhNBvu2/Bi0+
	uVGpBM5QKgVu/XgDp72tnaF4XTY2kw0hOEAx5FwLYeKafckMrWQ7F3M/tY2Q2p9oldZvPfcxgjo
	92L654s9Q25VLmAQtWK8fEFzUeXn8GZGSUSROM4cF5+ktV+HcS6c6GKVygjRMRcSFsDJYHnBJUT
	fTiWnmFFHG0Ns+mElR8xQipLO3AIRIjQfSutjk/TweGKXSj540YGGSLcsFPocmY1yZpoPKaGfmO
	mIrPMug0VUWk=
X-Received: by 2002:a05:600c:6085:b0:456:1b8b:b8ab with SMTP id 5b1f17b1804b1-4561b8bbb3bmr77641375e9.30.1752577215398;
        Tue, 15 Jul 2025 04:00:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvLBXQE4ArALHQLB4NkFBGD4rJKckvmXpQwHHB8XEVhqM7Eox/KFB5OvuAq4wE1jUZVKgQ0w==
X-Received: by 2002:a05:600c:6085:b0:456:1b8b:b8ab with SMTP id 5b1f17b1804b1-4561b8bbb3bmr77640895e9.30.1752577214894;
        Tue, 15 Jul 2025 04:00:14 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-456101b616csm86882545e9.4.2025.07.15.04.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 04:00:14 -0700 (PDT)
Message-ID: <bfa4949f-8b20-4660-a67e-a06a07fe4e3c@redhat.com>
Date: Tue, 15 Jul 2025 13:00:13 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] net: renesas: rswitch: add offloading for L2
 switching
To: Michael Dege <michael.dege@renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
References: <20250710-add_l2_switching-v3-0-c0a328327b43@renesas.com>
 <20250710-add_l2_switching-v3-3-c0a328327b43@renesas.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250710-add_l2_switching-v3-3-c0a328327b43@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/10/25 2:31 PM, Michael Dege wrote:
> This commit adds hardware offloading for L2 switching on R-Car S4.
> 
> On S4 brdev is limited to one per-device (not per port). Reasoning
> is that hw L2 forwarding support lacks any sort of source port based
> filtering, which makes it unusable to offload more than one bridge
> device. Either you allow hardware to forward destination MAC to a
> port, or you have to send it to CPU. You can't make it forward only
> if src and dst ports are in the same brdev.
> 
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> Signed-off-by: Michael Dege <michael.dege@renesas.com>

Minor nit: you should specify the target tree in the subj prefix (in
this case 'net-next').

[...]
> +static void rswitch_update_l2_hw_learning(struct rswitch_private *priv)
> +{
> +	bool learning_needed;
> +	struct rswitch_device *rdev;
> +
> +	rswitch_for_all_ports(priv, rdev) {
> +		if (rdev_for_l2_offload(rdev))
> +			learning_needed = rdev->learning_requested;
> +		else
> +			learning_needed = false;
> +
> +		if (!rdev->learning_offloaded && learning_needed) {
> +			rswitch_modify(priv->addr, FWPC0(rdev->port),
> +				       0,
> +				       FWPC0_MACSSA | FWPC0_MACHLA | FWPC0_MACHMA);
> +
> +			rdev->learning_offloaded = true;
> +			netdev_info(rdev->ndev, "starting hw learning\n");
> +		}
> +
> +		if (rdev->learning_offloaded && !learning_needed) {
> +			rswitch_modify(priv->addr, FWPC0(rdev->port),
> +				       FWPC0_MACSSA | FWPC0_MACHLA | FWPC0_MACHMA,
> +				       0);
> +
> +			rdev->learning_offloaded = false;
> +			netdev_info(rdev->ndev, "stopping hw learning\n");

You could factor out the above 3 statements is a separare helper
receving the new 'leraning_offloaded' status and save some code duplication.

> +		}
> +	}
> +}
> +
> +static void rswitch_update_l2_hw_forwarding(struct rswitch_private *priv)
> +{
> +	struct rswitch_device *rdev;
> +	unsigned int fwd_mask;
> +
> +	/* calculate fwd_mask with zeroes in bits corresponding to ports that
> +	 * shall participate in hardware forwarding
> +	 */
> +	fwd_mask = GENMASK(RSWITCH_NUM_AGENTS - 1, 0);
> +
> +	rswitch_for_all_ports(priv, rdev) {
> +		if (rdev_for_l2_offload(rdev) && rdev->forwarding_requested)
> +			fwd_mask &= ~BIT(rdev->port);
> +	}
> +
> +	rswitch_for_all_ports(priv, rdev) {
> +		if (rdev_for_l2_offload(rdev) && rdev->forwarding_requested) {
> +			/* Update allowed offload destinations even for ports
> +			 * with L2 offload enabled earlier.
> +			 *
> +			 * Do not allow L2 forwarding to self for hw port.
> +			 */
> +			iowrite32(FIELD_PREP(FWCP2_LTWFW_MASK, fwd_mask | BIT(rdev->port)),
> +				  priv->addr + FWPC2(rdev->port));
> +
> +			if (!rdev->forwarding_offloaded) {
> +				rswitch_modify(priv->addr, FWPC0(rdev->port),
> +					       0,
> +					       FWPC0_MACDSA);
> +
> +				rdev->forwarding_offloaded = true;
> +				netdev_info(rdev->ndev,
> +					    "starting hw forwarding\n");
> +			}
> +		} else if (rdev->forwarding_offloaded) {
> +			iowrite32(FIELD_PREP(FWCP2_LTWFW_MASK, fwd_mask | BIT(rdev->port)),
> +				  priv->addr + FWPC2(rdev->port));
> +
> +			rswitch_modify(priv->addr, FWPC0(rdev->port),
> +				       FWPC0_MACDSA,
> +				       0);
> +
> +			rdev->forwarding_offloaded = false;
> +			netdev_info(rdev->ndev, "stopping hw forwarding\n");

Similar thing above.

> +		}
> +	}
> +}
> +
> +void rswitch_update_l2_offload(struct rswitch_private *priv)
> +{
> +	rswitch_update_l2_hw_learning(priv);
> +	rswitch_update_l2_hw_forwarding(priv);
> +}
> +
> +static void rswitch_update_offload_brdev(struct rswitch_private *priv,
> +					 bool force_update_l2_offload)

Apparently always called with force_update_l2_offload == false, if so
you should drop such argument...

> +{
> +	struct net_device *offload_brdev = NULL;
> +	struct rswitch_device *rdev, *rdev2;
> +
> +	rswitch_for_all_ports(priv, rdev) {
> +		if (!rdev->brdev)
> +			continue;
> +		rswitch_for_all_ports(priv, rdev2) {
> +			if (rdev2 == rdev)
> +				break;
> +			if (rdev2->brdev == rdev->brdev) {
> +				offload_brdev = rdev->brdev;
> +				break;
> +			}
> +		}
> +		if (offload_brdev)
> +			break;
> +	}
> +
> +	if (offload_brdev == priv->offload_brdev && !force_update_l2_offload)
> +		return;
> +
> +	if (offload_brdev == priv->offload_brdev)

... otherwise (this function can be called with force_update_l2_offload
==  true) we can reach here with priv->offload_brdev and/or
offload_brdev == NULL and the following statement will cause a NULL ptr
dereference.

/P


