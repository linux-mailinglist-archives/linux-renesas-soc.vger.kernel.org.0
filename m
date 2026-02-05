Return-Path: <linux-renesas-soc+bounces-27932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IKgFhVLhGm82QMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 08:47:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB191EF91D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 08:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5CAD13006453
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Feb 2026 07:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23CAA35EDD9;
	Thu,  5 Feb 2026 07:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="ubv950V5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF76434C12B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Feb 2026 07:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770277651; cv=none; b=CR6th2+RHMUP+Va9rQbHyBAspojlAqlQ6HbgfC3IF1S/4Wuj84Zwzd25qIoZHxW70vQKVZ2vvn2oSJAECaQkVeCPNTJqMzsGRq9EU+AZoDTTffotfefiwFaz1Dp3AMWUU2wwsEX1F+UwKOTi6SmzKAaJ06OBvmjKmL/duKl0J1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770277651; c=relaxed/simple;
	bh=lpLJPqAArX7Iuvct1n5ysPyMdIPUlZ3UA9Csaqg0/gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a4vJQrSI61FGoe+Osq6ZQ1Bh6b+Opu5tZToz/k4E23d4FV2iZ04WGuL5UV9ltu3TurhAD1bwDXwhgvp1vsGg1Art2eTgoM4XkTw8nvoC1C1y5Vk5IJI34OiUGKoT6x33FGxWTc/Zm/ahefpM5YVEJalv7xN2wEFMlA0ZThLvpJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=ubv950V5; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso6144755e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 23:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1770277649; x=1770882449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gS8eTVscdu7wmx3oE8qRW7nf+y0FrAEFYszd1RiMygE=;
        b=ubv950V5xj7Yf3VwyCfUkLn468St+ca17NfDIVJ8r9yBFiEeYpxHXex0N9fcn14YAr
         HRp7Ykiza3Bp81qZVTDPTSoynEDXa78tqZsNATJQ5lBxu8hnpe2TXU85ToCPT2LzO7zD
         6sXYd9bfrL/nPZ78OtFbYAVDJSbqAWLpRntl+EsCf6walZn1VGjTCMscJCLFJFwh//7I
         QlHXQmOEMzSTNmyGHaXaUEMLgvkYJYniYtUfWtEzwNdMsgJnV4rGkc28MWGB3Mn8UspD
         CBqCmlDFH+wd67QtQJCYY2b2gNDA2WSy2wI+FfU2lGLsTYpkLhn7PNjz39SXsYMoxvQT
         TLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770277649; x=1770882449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gS8eTVscdu7wmx3oE8qRW7nf+y0FrAEFYszd1RiMygE=;
        b=KHmWr8IQ20lmf013uhYkBzND1HLW98Q5gIibzj66gKivztRWVkzro1GfX9LR6DtBEi
         9uwTH3iXQ8NSU3zS8M20dJAbPyWa4PpCtWuK4gTPcBUs1sFJYcvFHxSTgLlpfYP3Eou5
         /ZjNZ9ZaSpHGHt0ma56ejApDGUe7ZXTRQBIQXf/ieulXeqILD6nhIvwLJkhebhNyw2a/
         qqquaJ1li/TVDbLb+zo2ZZznnKG7TqNmVH8ZwJ/c1DsaSjN7CokMWs8EtAGCRMw2VWVL
         XV+670CQq4aodGWm6Yy59ipYK0lcGF5I0Nhy0Nuyndr+yFQ6HOpXJHexRnngyTbGJ32s
         +5xQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8ovBkyu0FGuKI26swtcewWecuze1zIocpDMwsJJ2+9a+1Ob7r6k2Th9FnAAtp4PiVZXARzWudtHuoDu9VCcYqMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvawdW695jRhbdMh6GXbYGryK14pdMO+47v3a98xV9FUoadGTK
	MAk+K2Tl/bbe823ipo7w0Yyb86aimBEC96xv8PJL3McqVOBMMP4f5dehsbB5u9Jtxew=
X-Gm-Gg: AZuq6aLuRuNeTSkyhYjTMFrhkKosSqMZgzANjHHb0ecTG52OLEen2dHuZuiQobhzGqD
	ongCGBAxgo7yYv2AIqfBoTcne6398nuqWfLlgT6X0ViruG9NyfDdg1QXqxOPkOishm/k6y4PHss
	fc8osRqsxXso2ivceP5JS12tHNYfnF++Ijo854zTvhPnGJBzdI0EHI+PT7X/O8P0XmCbCMe+9Xu
	BeZuAgoSyUx63TyhZ+P2OCNk7IN53WHbVXVzo5SDSbdDB+WF5f23E3+8Q7RM8A49JZyIDKTf9BJ
	mQKJCenuB0lFQK3OLrJVDTxWA0OiUEII3WVA5CBPQvw6ZCzRi1BkYvBs4s5h8foj8afHb6/gdh5
	ZkmegpKHpOV72veoz33au3gn7MvsEs6yzLWIott+GVlQhtdZXAr2APxUglp042Ft6OMY+ePFY4w
	iP4OpyWzZcLNJIo240aZWUB3+fdTnnsp24BfQh
X-Received: by 2002:a05:600c:4e05:b0:477:c71:1fc1 with SMTP id 5b1f17b1804b1-4830e979260mr81218345e9.19.1770277649149;
        Wed, 04 Feb 2026 23:47:29 -0800 (PST)
Received: from ?IPV6:2a02:810a:b98:a000::b3d5? ([2a02:810a:b98:a000::b3d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe62fe7sm57328395e9.4.2026.02.04.23.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 23:47:28 -0800 (PST)
Message-ID: <3b1405cd-6c7f-4883-95fb-151cab223a68@cogentembedded.com>
Date: Thu, 5 Feb 2026 08:47:27 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: renesas: rswitch: fix forwarding offload
 statemachine
To: Michael Dege <michael.dege@renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260205-fix-offloading-statemachine-v1-1-640224a531d0@renesas.com>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <20260205-fix-offloading-statemachine-v1-1-640224a531d0@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[cogentembedded-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[cogentembedded-com.20230601.gappssmtp.com:+];
	TAGGED_FROM(0.00)[bounces-27932-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[cogentembedded.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nikita.yoush@cogentembedded.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,cogentembedded.com:mid,cogentembedded-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: EB191EF91D
X-Rspamd-Action: no action

Hello Michael

> -		} else if (rdev->forwarding_offloaded) {
> +		} else if (rdev->forwarding_offloaded &&
> +			   !rdev->forwarding_requested) {
>   			rswitch_change_l2_hw_offloading(rdev, false, false);
>   		}

Although indeed the condition in the current code is not correct, I'm not sure comfortable with this fix.

Full condition for a port to be a valid candidate for hardware forwarding is

   rdev_for_l2_offload() && rdev->forwarding_requested

It is not obvious if at this point rdev_for_l2_offload() could get changed from the last call to 
rswitch_change_l2_hw_offloading(), so using only the partial condition at this point does not look good 
for me.

I'd suggest to either change to something like

if (rdev_for_l2_offload() && rdev->forwarding_requested && !rdev->forwarding_offloaded)
	rswitch_change_l2_hw_offloading(rdev, true, false);
if (!(rdev_for_l2_offload() && rdev->forwarding_requested) && rdev->forwarding_offloaded)
	rswitch_change_l2_hw_offloading(rdev, false, false);

Or maybe just

if (rdev_for_l2_offload() && rdev->forwarding_requested)
	rswitch_change_l2_hw_offloading(rdev, true, false);
else
	rswitch_change_l2_hw_offloading(rdev, false, false);

since rswitch_change_l2_hw_offloading() has internal check for the current state and returns early if 
the requested change is already applied.

Nikita

