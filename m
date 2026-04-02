Return-Path: <linux-renesas-soc+bounces-30747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MZsGL1rzmmpngYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 15:14:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E43ED3897D7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 15:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F086E3175913
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 13:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58A239B949;
	Thu,  2 Apr 2026 13:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vj/6cc1l";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qTjfXiS7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6248726ED37
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2026 13:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134977; cv=none; b=Vnz3IJM/SMa92EYCES/S+swzq6ObfpyUOb3C2gKPsvSqSGpEzJ4QghLvJqXbuIRybQ6Qg0gk3kGH804ENpzOyDi49dNLKOq9Wy5/lSEFFe2Q6Qc0ZDIqVNx685ujbG+SZL6KAmHbiwGxnLISeSAEtgvp4sTAKUd/hdTiRVdd1c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134977; c=relaxed/simple;
	bh=SnKSzDltBgYBALCDwQxCA2ft7JBfIGZ6PlA2dDY4KdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q/yJyZ2SUYXR0VnCBWOUC4UVrmEw+o8aOTt9qiepqxaeSQfCnIDk/63UkuVnq0rRusRzjcp4/SIwMZzp1ytX1WxL2MWIGTsAEDaiv452pdGXKtXv6ioHbpSZCEyWF+eeYIfdB9qC7GFchb2nAB9TY78RA2bqHTc9bTLqzSY43jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vj/6cc1l; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qTjfXiS7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775134972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gyYBDxZ8zUQ5bRs4MjkmDO7qkbqdhTlj7yo33WH03so=;
	b=Vj/6cc1lrcg2EWrIWaOBMTlZk9qtAJkUe0K/e9/b2L2vVrkZFWQCqKWgIuLA/X0PVQMUO1
	2zihVGFCKOMkTgZoAcyw+rabc3WZX81TjGiHuUMcDBjFMu8GYPXdux2iJes+Ra0/4c18vM
	Ey1v18l2TSXXJZDk7aX/usKyXWUcpSI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-l6Uyqt8jNiaTdXs4sTTVng-1; Thu, 02 Apr 2026 09:02:50 -0400
X-MC-Unique: l6Uyqt8jNiaTdXs4sTTVng-1
X-Mimecast-MFC-AGG-ID: l6Uyqt8jNiaTdXs4sTTVng_1775134969
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48544725bdeso10515805e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Apr 2026 06:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775134968; x=1775739768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gyYBDxZ8zUQ5bRs4MjkmDO7qkbqdhTlj7yo33WH03so=;
        b=qTjfXiS7tTCcLBhWTonDpE3nHirt5Gg48KQ3k2BrnxP3DvLcXaQcjqQKtdu9pReww4
         bJJge8TXZhj+Ijg3Gr06jNikKAErAiW8llQhOc5+D4iVIzfWf/c3/P0XS0Lj++R09OeZ
         RTBe78OaebnQpPptDqlGFJRnJShhQY3X0gWPF6Nbn8xtJKUa4zvE+2nWq9ZyFNwTE+uf
         8sesJQ9H1v0fjSrzLEjuKeteDteTpqo/4jdeq+gWulLlcXj9SFWHk5dvgyGdKOJUQTLg
         L9BchHZ6AeB5cu1kvpIxhm5OnCMsSNYsjfCZDUC8TS5uFxWyv8psJ9dqlZLUJ+vsn25I
         Uvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775134968; x=1775739768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gyYBDxZ8zUQ5bRs4MjkmDO7qkbqdhTlj7yo33WH03so=;
        b=bjluMePwNBEml+Ve19cF4LiWsqFxi18LJgc9Thivr2DyY34JTvLjAbfFb/kkGoCAre
         SRvMD18cDbUvafuUXQ8lp9Ai9i2Ph3+vKfCi7sR+1MpWba6VwcIIGLOOJwtnXBnBGgEa
         bl1hTgRNGNwX0INAAK87a0+US+w2iXqRIDblSwfkgfWQHMbJmVLGZABCDklMhn2Wk/Cf
         zZDrRRDG9E6MRTtsNh4wwQNFGtR1XxFUMZCifq/ibpkCEYgM/HrMh1OnuUNG5rMYYpbt
         0E27WPa3mEf8mi9/EyIW+dct2+v39kJwq9G9SeGn6mGzUI9jEoS8QjfPYm5AcADwgtjB
         qzSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMt3+WWB4om2n9b32o9Z2yxoL/7lxwMbqY13xcegbp4b9TutbLsDK2S0gLG1t7srtvfExM1uUlPfvrQ7C5PxBGJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yycyf3SlXhR3DqsYUw+eYo0oOwHdIYx1MTEhomoeoAAFPdHZlRj
	wIg12xDCv12ulCUsfOkoP4BIFT4gjiGgNuISi22kY5ui/uEJxEmei168hfMQ07tx274+Akhg4zG
	umV7jQRxKVoZKc+QnW3iy440KqNsHMuYlfuXYbpM0nNyOIpFpC2EI5fTmI8syD40bGRMeK8U4
X-Gm-Gg: ATEYQzz3i4PCAVGdod3VuVkoKBIR9NseoQ6JNs5CG0y48FYF8Pz3cbnoobmQeQgBqhg
	pXb8XM1ScXdKCjeU3PjpGViLMVuQagoncDeEqxeVo/OSNHeM7FU60d3sG5etMiFtHmZoMAYQG5b
	qRvjujFwj2sLXEBjc9iS+6ZGb+DltCJ4/L/j7DkJUx2IaudUk5B74XUaoTytBkKrFmqp2bz/Trl
	T5Y5r00MF2bozkovae0YRdOLWJYnIEnK80jzJNUcZAejF4rTMOj4+YNz9hz+NFQ5t2F4Uhven9o
	bwTkw7xwgUq8S1zbHwu9+iZuAAniwSTR0lb3pGsxjnGCMiGTH2n10UGfUQoCU9evDo8j5gYBogC
	fGSKI8xwkwJ86DgJrm0s1w5Qeo8RfE5XnVBzWrzhy+f71SQrKXkkzWRbhag==
X-Received: by 2002:a05:600c:c08a:b0:487:cd8:4c9 with SMTP id 5b1f17b1804b1-4888b79fbdcmr45575825e9.27.1775134968341;
        Thu, 02 Apr 2026 06:02:48 -0700 (PDT)
X-Received: by 2002:a05:600c:c08a:b0:487:cd8:4c9 with SMTP id 5b1f17b1804b1-4888b79fbdcmr45575195e9.27.1775134967771;
        Thu, 02 Apr 2026 06:02:47 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.153.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm150299115e9.0.2026.04.02.06.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 06:02:46 -0700 (PDT)
Message-ID: <9c101981-4a85-48c3-ad0c-c16a362929eb@redhat.com>
Date: Thu, 2 Apr 2026 15:02:45 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 04/13] net: renesas: rswitch: add register
 definitions for vlan support
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
 <20260331-rswitch_add_vlans-v3-4-c37f41b1c556@renesas.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260331-rswitch_add_vlans-v3-4-c37f41b1c556@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30747-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E43ED3897D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 12:03 PM, Michael Dege wrote:
@@ -847,6 +903,98 @@ enum rswitch_gwca_mode {
>  #define FWMACAGC_MACAGOG	BIT(28)
>  #define FWMACAGC_MACDESOG	BIT(29)
>  
> +//FWMACTL0

Please always use /* */ for comments

/P


