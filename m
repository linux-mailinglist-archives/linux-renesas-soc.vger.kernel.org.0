Return-Path: <linux-renesas-soc+bounces-31759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCcsIhAp8mkxogEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 17:51:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F2D4974C8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 17:51:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CE161304E4CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 15:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAFC63242AC;
	Wed, 29 Apr 2026 15:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="MkIO8/Na"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f226.google.com (mail-vk1-f226.google.com [209.85.221.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BC637E30A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 15:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777477197; cv=none; b=rvImMYIJFp1uAyHBdCMRYuNpltARNHllw7sTeXTvGl6ydf/14LgFjRlhDYgVQzD4yUsj8FmeTYLFCW0ucth4MHgirK16SzaVJxId2wmu8qZJVqiSxcGnmZEuy+L8MNBVnz2YJSNrF292xrPUG1eJKgVQ6MCaCHHYkIcMN9BtkCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777477197; c=relaxed/simple;
	bh=z9tjCiDomJUS16kqSqnbRm4EHxgfQjNSyK2cJXYp/VA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=E3LPsy1zrRfx/1ej9v9HuRxZ3LgTP9EE7fZpzSHGHqyWsZ82+kxe5tqiJEibVz5jLyWZKCJ12ITDkXMQu/Ea5nDhimkO/R9zWWYCk99XOQfs14L4DQyXVQWERXP5aoHZOvLrGXaLC7LtPGMTT5wessm2V3z4X7vpEotPvvK6krw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=MkIO8/Na; arc=none smtp.client-ip=209.85.221.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-vk1-f226.google.com with SMTP id 71dfb90a1353d-56db1b3626bso8182833e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 08:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777477195; x=1778081995;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNID+xnAT4/eagYcPb2Np/6K90V+gH/f73uugiIiXTw=;
        b=OJEQu+j0SYa33LG0Ha+ZgxYV2SfqRCTEYVyybXLTMcD/sEyWYqpJ2EWTdTO/QOHSNX
         Ol8abmOEwce6KJ8iwo0Y4cPmbgx+XmOb153A7k7HVfEf91kegSmURaZMLle5eFBqf+hT
         7b0jDDjYXkMy+lgpiW/FdOPscSjN3/439Vf8+fGY6r553irwjZHo2aDTXs/A5RXMvSQ5
         9PFnCnTQqdES7w/9nCI+vMpvecb5CJkscbIqyn70FrwOemMw4tu8N0IW5NDOQCWwg/cO
         N6nAL6CsV10iPF6K4aba2Yewdx1x2gLTPh0KI6oKnYXcMAGOSfbDLPQR4OgdbZOn/JwQ
         zMQg==
X-Forwarded-Encrypted: i=1; AFNElJ97zpa2mRktojn1bZgxtyXrsYT6NHnkfAR+1TisqE6yZNEA0k6VtaJMcFZaXCaZIoU/ZQ4txkbr7/O4TYm/TmgBcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8JEfsQF+A+lHJo/95HyjtPIUJSWGZMvUXYeiZBDmpIq1ZUa95
	/Zo3h4zPeZYET3q3xdn8AVDgESK0lYmU02owTgyxi2EDK0VxKGhH8fwL+s2rX5LKkieMJ/9r7f/
	ueMp9qJ+ZcP5XE9sVSRTNGZMilRWK2Pipa8wIXgZtC/MqFFLbgiQgzTpj/kIM1jg0qkQmR1lTiU
	WFCwNjYUGN6PFMbo/Es9xg/6Cwlpum/OFNK+VUR7bXI+80ZLmJjEaHPyk/qTxOiiunWmDfmLIhi
	6r9E+N3N7Z/KgfwMvEbwmgqcKpwp8E=
X-Gm-Gg: AeBDieuP6h7cekGOMbAuPrf4S7ZpMVSt1L0I7JUILek8Z0QgOHRv9mRSIe5xKs7eCyL
	vjk3hbD8b9SjXWrQVpAD4vIKTe/lROloAyvbvdzIiYZP/vOqrNfFMObnWvQ8bOkG2vp8hzVrC+k
	cYfFOt8mWSSyVGHCXlV3bfL88ZLKQqAdjh0arjrMUeJQ4/Qq1p7TAThjTbzPrnf/M17PxKAGWn/
	x5nHAr4Qar0hKVAVI7wInsl6BSKTqORmPmnxg4xq4oZW8sNQHg3GT2e6bu8PueaeRSRYuN5M8F0
	/SVIBi88tOnNN2BRRQzIEzzLcDIBd3RwAB1A7K/TljgqnizhFNgWM96eEFqeV/keY/rQ2ykVcNZ
	A9tKA716/5oTWLXM9NhGBJIhKr+kk0SnI2X0gbEDZPFW9NLKzXA1YdTsNhGrkipYvNi0sK8iuYT
	/7orgDwDonBFWcyKT2Shva
X-Received: by 2002:a05:6102:4a91:b0:61c:5310:e9d6 with SMTP id ada2fe7eead31-6280b9e93fcmr4225318137.27.1777477195291;
        Wed, 29 Apr 2026 08:39:55 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-6298496c8c5sm143026137.20.2026.04.29.08.39.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Apr 2026 08:39:55 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12c8d7d4a79so12028027c88.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 08:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1777477194; x=1778081994; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dNID+xnAT4/eagYcPb2Np/6K90V+gH/f73uugiIiXTw=;
        b=MkIO8/NaEllsIa/cKn40SrRP1E/A3vFWkhhJyuZ27V90nA2y7tgiBMhANuNxxrJOUb
         R9nqFOhtedJ1qGANcP9KxXI/iqOAXf/rvmg/Vj+iwtwyz0IjFBGqBcAycfUN67QK1wzp
         1vUe0rwh18uORmNM2MVTjMaMr1H2gjIanygf4=
X-Forwarded-Encrypted: i=1; AFNElJ9h3fAUJDMpPrZLGchR0dKMLYXmGbhvyqYQ5TmF4DMEOUmlpIR3GEkH4Z3WINUCoSUd2GI0z46uY69p4mOC0YvLlQ==@vger.kernel.org
X-Received: by 2002:a05:7022:eacd:b0:12c:2cf8:2f30 with SMTP id a92af1059eb24-12ddd9614a5mr3768783c88.15.1777477193984;
        Wed, 29 Apr 2026 08:39:53 -0700 (PDT)
X-Received: by 2002:a05:7022:eacd:b0:12c:2cf8:2f30 with SMTP id a92af1059eb24-12ddd9614a5mr3768748c88.15.1777477193388;
        Wed, 29 Apr 2026 08:39:53 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de3216e81sm3765626c88.4.2026.04.29.08.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 08:39:52 -0700 (PDT)
Message-ID: <25d267b9-7839-413a-ad91-9c6802bcf292@broadcom.com>
Date: Wed, 29 Apr 2026 08:39:51 -0700
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH v3 00/15] SCMI Clock rates discovery rework
To: Cristian Marussi <cristian.marussi@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Cc: sudeep.holla@arm.com, philip.radford@arm.com, james.quinlan@broadcom.com,
 vincent.guittot@linaro.org, etienne.carriere@foss.st.com,
 peng.fan@oss.nxp.com, michal.simek@amd.com, geert+renesas@glider.be,
 kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
References: <20260428201522.903875-1-cristian.marussi@arm.com>
Content-Language: en-US
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20260428201522.903875-1-cristian.marussi@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Rspamd-Queue-Id: A9F2D4974C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arm.com,broadcom.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-31759-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,broadcom.com:email,broadcom.com:dkim,broadcom.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[broadcom.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/28/2026 1:15 PM, Cristian Marussi wrote:
> Hi,
> 
> it was a known limitation, in the SCMI Clock protocol support, the lack of
> dynamic allocation around per-clock rates discovery: fixed size statically
> per-clock rates arrays did not scale and was increasingly a waste of memory
> (see [1]).
> 
> This series aim at solving this in successive steps:
> 
>   - simplify and reduce to the minimum possible the rates data info exposed
>     to the SCMI driver by scmi_clock_info
>   - move away from static fixed allocation of per-clock rates arrays in
>     favour of a completely dynamic runtime allocation: just allocate what
>     is needed based on the effectively discovered
> 
> This is done in patches 2-6.
> 
> A further bigger optimization suggested in a past series [2] by Etienne
> would be, whenever allowed by the spec, to limit upfront the number of
> queries in order to simply retrieve min and max rate, that are indeed the
> only rates needed by the CLK SCMI driver.
> 
> The approach proposed in [1] was open coding and duplicating some of the
> functionalities already provided by SCMI iterators, though.
> 
> Patch 7-14 implement such optimization instead by:
> 
>   - reworking core SCMI iterators to support bound enumerations
>   - use such new bound iterators to perform the minimum number of queries
>     in order to only retrieve min an max rate
> 
> As a final result now the rates enumeration triggered by the CLK SCMI
> driver, while still allocating for all the existent rates, miminize the
> number of SCMI CLK_DESCRIBE_RATE messages needed to obtain min and max.
> 
> Finally, patch 15 introduces a new clock protocol operation to be able to
> trigger anytime on demand a full enumeration and obtain the full list of
> rates when needed, not only min/max: this latter method is really only used
> currently by some dowstream SCMI Test driver of mine.
> 
> Most notably in this V3 I had:
> 
>   - picked up Geert fixes on V2: these could have been squashed in the
>     original series while maintaining proper Geert's authorship but as of
>     now I have simply picked them up and changed their order to be near the
>     commit they fix
> 
>   - dropped the "Harden Clock protocol initialization" patch that caused a
>     number of out-of-spec vendor FW to break
> 
> Based on v7.1-rc1.
> Tested on ARM/JUNO, RADXA/ROCK5B and an emulated environment.

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

