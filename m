Return-Path: <linux-renesas-soc+bounces-27956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJ86GNKxhGk54wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 16:05:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E54F4653
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 16:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AD8D3041A49
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Feb 2026 15:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF5C421895;
	Thu,  5 Feb 2026 15:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="h86aNLGO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1EA41C31D
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Feb 2026 15:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770303826; cv=none; b=kosTap5ZowjSKDlMmfchMheLLsyecARL9JECh8P7OnQC/bptK5h/VQOGWwxTuqTei3XyEOblBaH1v/NIb/OtVEcmho57+jR61A6Mtviztpoxh/uycbA58s/oDr8w3SS0X98/6nVuCdC1G2Z7n1NBdmVoAnyUdgDmmvgTMKspfdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770303826; c=relaxed/simple;
	bh=QDt+IVdx40jFCSq5PK6HDvUBfE75fBxnDd2zJEdpf10=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=lw76xHZDFVS741RGyy1B+s5cDMAYBpIRoPh0UtUGiVel+fNsMUvE2FMBbJ19WeC6yuqnVeH0CNFsfuxY5o07Vms8umufYNd0Vz5ybRpFNjADV1M5wUzAWzmNYTxZw6YQV3GvJx44jPMq27MrrIbKokATQH4MzZq+0NF6CUaqY38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=h86aNLGO; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so9796485e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Feb 2026 07:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1770303825; x=1770908625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lZ+H0eQdVfdIdysvIL1NJVX7+mMSZtddMzAlKVyZ/Bw=;
        b=h86aNLGOFWd07IDnZe3EAN19Ers9TXbmAam+RREIJM4ct7PjANLJJBsaXPOE1Qcyv8
         JyzGPON+np0cipWDXkAEUOaZnwL2GSgZqAotEfpVc+UU4pgfcoufolwXc+DVm5eKb4uL
         nMpnhUKMJaC5QG44C7VLeZyw1TeBgVTwyzz6WwQuYSCb93labNV5+n5CyO+LpDOu0mWm
         A+DwIra3q+3oH33CqASKwVlrSPXirGUvtE1Lyni06ZvAkDokqQ8i2ukIDL5lx7dSWyZU
         rBC13fFMJXhau+i08AQ7PQpB4esrAh7LGpNuNzTPhlvs64b6DYNAqJKIbBYdq8GbZJf7
         XU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770303825; x=1770908625;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lZ+H0eQdVfdIdysvIL1NJVX7+mMSZtddMzAlKVyZ/Bw=;
        b=eHf6zF2wzTN0FhcgIeCH956VhEWzPYwNxdx5n7MShSBjP5sL04cIHpWpTjdT495LtU
         PtVqlv6fnIup+rbqmRe0Kb14kKoEix2NxmNXz5O7AtglzfYg9M9ynv4T0GJocS7eGcoB
         2YxHVKtFCMPOXoncWiW61Jqt9FBb8HF2zCpeJ7Ron7rlyaboNX5pnsu1Sfa86MBeE/ev
         Ms3dVf90ctywDONaK5p+cKpoIJmqjT7OptaZ0CEtdcCVESnzBfDiZpQ8WAyyslm8IizG
         o6BGQXGptBGwxPY9kOTgQWy1MXv+Jaf6WrYpI1kswX9Q5p+wxc8CCj8DaI3tzZWRE3rb
         fKMg==
X-Forwarded-Encrypted: i=1; AJvYcCWEDXFegiXTF87yI1/9yfMBNGz/1N4MV7sAHaRmvrji3FoOqaqpkLYY8/k5eJi6mPzwJCanDYRMEki4KSbwzR44KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsAUpGIxPpk14ch3rcgur3Vv9YndOfsKsIAXFjT6JfAh7NxRGI
	6dRIEfLE2GOLBDocHqqH7ZnNY+Vm7GYRtZR4uVe+DtpXVCZeO4gdBMBCX5Kj2OTNmRrVuJbpbKO
	yM6WP
X-Gm-Gg: AZuq6aJ53z847uIuixw/cbU5kqrD1T3+SafSCrJMqAp6vGMGSs9e457C0UtVjaerZLm
	kMHoTNfqUuPZUNJvpToMAJL0DEGZLAEsoQjDq64lK4NbJzZK+JQH819kRopQtMbnpU/qQMLmLC1
	F34GIv695sUbkjboofOXhbUrwOCgW0ylzjXBmSqlOnNpTRrKdIPYr0KGZ79Xu8cORaG7/9Es0mL
	mrWt2mERuTNiKVZa0CBrCkwrjghZAjbrC+9XnDArwFejso3092haX+RYB3HR2T4+maqWXU0LoGZ
	KKHE0eCRbyoz5UqjnMJfuRJ+HewoLWuhocCpTp4lzcroTMjIz35N/OO5yugBZLDed/EGcXQkRhh
	jDR5LsiA4UVvgqTmT1Q3g/oPGc8X0CUe0c4Vmntxl7qxH4Zu7iN89LkXkxu5Rak5BqBGXzQVqoh
	w1/P0qcNuXMG4qirlEhiBFiBb5vRk3VeH40IzwnIHR30iAM1k=
X-Received: by 2002:a05:600c:8b63:b0:477:98f7:2aec with SMTP id 5b1f17b1804b1-4830e93ea19mr102464055e9.3.1770303824859;
        Thu, 05 Feb 2026 07:03:44 -0800 (PST)
Received: from ?IPV6:2a02:810a:b98:a000::159a? ([2a02:810a:b98:a000::159a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e25e8csm12978285f8f.1.2026.02.05.07.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 07:03:44 -0800 (PST)
Message-ID: <ff475397-8894-46e9-858a-78714c5b4bd5@cogentembedded.com>
Date: Thu, 5 Feb 2026 16:03:43 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: renesas: rswitch: fix forwarding offload
 statemachine
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Michael Dege <michael.dege@renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260205-fix-offloading-statemachine-v1-1-640224a531d0@renesas.com>
 <3b1405cd-6c7f-4883-95fb-151cab223a68@cogentembedded.com>
 <d6a9356d-6fd4-459b-9c5a-2f3e20368bbd@cogentembedded.com>
 <TY4PR01MB142829D9748A483ECAF19FD3D8299A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
 <25ff0841-545b-433a-8e88-6e463ea718e7@cogentembedded.com>
 <TYRPR01MB14284CB75C7DCD35381BD17EE8299A@TYRPR01MB14284.jpnprd01.prod.outlook.com>
 <237bee8b-a7cf-4c14-9946-8bf72dbddde5@cogentembedded.com>
 <TY4PR01MB142829EB0EDDE13B588F949298299A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
 <a4cfeba2-23da-4fdd-870b-6533b5ce267c@cogentembedded.com>
Content-Language: en-US, ru-RU
In-Reply-To: <a4cfeba2-23da-4fdd-870b-6533b5ce267c@cogentembedded.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[cogentembedded-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[cogentembedded-com.20230601.gappssmtp.com:+];
	TAGGED_FROM(0.00)[bounces-27956-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[cogentembedded.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nikita.yoush@cogentembedded.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: B5E54F4653
X-Rspamd-Action: no action

>>> The driver was originally designed to enable hardware forwarding when not less than two ports are in
>>> forwarding state. When only one port has hw forwarding, there is no destination to forward.
>>>
>>> Nikita
>>>
>>
>> The current driver allows Linux to use the bridge port as local port to the bridge. The offloading
>> Also supports switching traffic to Linux through the bridge port. Therefore, the offloading shouldn't
>> Be dropped if only one external port is up on the bridge.
> 
> "Offloading" means - forward a frame from one hw port to other hw port without inserting it into CPU 
> queue. Offloaded frame is never visible to software bridge.
> 
> There is code that allows offload only if the linux bridge device used to connect rswitch ports does not 
> have anything else.  If it has something else, offloading is disabled (because there is no way to know 
> when a frame can be processed within rswitch hw without sending it to cpu).

Ah I see the code that explicitly enabled l2 offload only when at least two ports are active is not in 
mainline.

Still, l2 offload requires at least two ports participating, by definition.
When there is only one port with hw forwarding enabled, it will get empty allowed forward destination mask.

