Return-Path: <linux-renesas-soc+bounces-33960-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sbZkNOdRLGprPQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33960-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:37:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D12B67BC95
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:37:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Zk5Fh91g;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33960-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33960-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35F5C34959E5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 18:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94B5C1F099C;
	Fri, 12 Jun 2026 18:31:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F282773F9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:31:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781289096; cv=none; b=GIoVBoaWAd8A+HqlN3gCVZdfrsOf9eEVdnrbJJ/9RKe2wTkNyGKjMfajTuJBNIn5QuUohnhuWMiWyLb4C/NINo1atI4cK/PlD91vBC1oBVA9xtpL5wRxhXBNFkvjzTokvbMRfa1F5l2JG37O4PxD8tR8A1DNCoXLKtisKITgzAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781289096; c=relaxed/simple;
	bh=7yn0/utgYVTOzUs+vb5c05ZV/Jxy6WpLqXn0DYdLdKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XjH8xsyQCM4+4lr0rbMBBkO/tR1o7g6QUS8Ob3LeNAQPdqQi1dAWd9Ycwj+d58ADlBM2SrXeoCuUlxlC4POtU40Pta+OF29zqZJT7bydIn3GTTNZ7iGrmbwKydSInrzj7rWOJU24dfwvv3kJOnMDTRXjj15UOAMTorcbXnuZRi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zk5Fh91g; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso10268095e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 11:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781289093; x=1781893893; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=95AvFvq/SHF/XMgHFAPH0gEXz2BnMwa+fdNSG/EQyq4=;
        b=Zk5Fh91gSl4XTJRJmoM0if8u9PfmlOEE8uKaDGRYI4WTzE6LgYbi8eo+bmf3SCT/Je
         8x5IvZVP78knfKgo0hmeKMHQrynb7mdhXddEiz+cJW9PasQlNBrI8hgrxTALX46Zfjkq
         of/k//95hGUziOspiMxBKvjylZwXflEaka+ddd9JsVsj5O+DX8aAgUg8baFCJTYR60dA
         J/dUpuVkNBpYtwpliX2xoyDc/8UnQQyshogqRkpxCJ7EbzfowkrZT9lOV0xFC4PFcBIg
         v8r40Zv3Voa3wbH6Xw7obKOVwSwgHWiY+DKOK1hzzL3mouI/tF2mb0/fRz3tPu0u1ZWG
         N1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781289093; x=1781893893;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=95AvFvq/SHF/XMgHFAPH0gEXz2BnMwa+fdNSG/EQyq4=;
        b=VZXZy9/ooim1VWomJEHFCPJMlkZJLnEK3ZLiBXJnEyKZdIKdEvi9tMscfwPcxlsf/R
         V9jn6YDmdWJLjFQSL7RqMEHc0Ks8+Ktxdvx2tDDyL9Ki07viQAlyMBiGVymIP8WBGU0N
         tcTk9cLmiJQ2v5JSdKn0xQsPyJfjz+jcV587ost7HdMA/JfEZzSq5wIR7hU6B5vkw2NE
         4YjLpSn4+V9lKC37+k4T2sJ7Fr8or40sEzv1YXCY78gfoH5OKvGWYrv3StHWFStOKZku
         MiAODZmrpplu/lmRXjx4P5CSwYJTFAHsDWq5Eb+ve7lmIyYeqLxNGke57viJXDcNPkS2
         bIXw==
X-Forwarded-Encrypted: i=1; AFNElJ+xbcspeFDvBs5gChTkjNmygvEn7WEEicZ1snmKfEdQr+xs/EqwYOzvbJ/xe+foBdpMAQvCXlyWyFabDauPOvca6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/j5O0+dwMnfdKvT3k5e6NG0rNUlnZ8Uu1l/Hiif9RrLSoiTb8
	9BJYH83lMY509qXSIUDAW2rdQdxpJIWoNSccD1OcM1O6tuw66Fy0ONo8
X-Gm-Gg: Acq92OH6duMt8s2YVHXnykxaAFa8UqTi/FqA0F5UIr9gng/KeUyl977fYScLl91Fh1u
	1uJfmVbbVIVZtCqlxSqSAt7uThBnbkjR5Z585XQ9zjMdIWYQt63HfVxm3o0SIO7G0Xp1Zt32v9o
	a6/rsoNkBn0iY74qqLcyXz2YE/sZehvjpTeJepgbmfkR14H/8oRsMMrS2IPDj1p2IKSUyEi7IAA
	HbcOpiEIaF98+6RcVVW56v9MaWsO/+2i9wDt+nDz9R/ylVOHzOBPjwRIHbkglvqhXwU2WuyDTbA
	WXF8SVphq8wXDtjP9MV+Y1xuKeI5Phl0LjSJbsix9TkUOCTDubgBzdOResIZWV5WhrKAX3HLw12
	gLfjChcRN7cYm1l3sgxpeovdOePbmT9vnYmj31065+RRNJWbL9JHms97V/FDv5mVoI4wnmW+Dpt
	o5MtzufTyhLgUdZdY2hPdOZPTb4eH3KF+ICM02Ks4KgFztolsXDRzNX3KCfuphPLPlf7y3yFQl8
	Ws=
X-Received: by 2002:a05:600c:214b:b0:490:bd1d:472a with SMTP id 5b1f17b1804b1-490ec4d7879mr37936905e9.15.1781289093399;
        Fri, 12 Jun 2026 11:31:33 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:742:25a:e03e:6c9c:49d8:2fee? ([2a00:1fa0:742:25a:e03e:6c9c:49d8:2fee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c0801sm6310585e9.10.2026.06.12.11.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 11:31:33 -0700 (PDT)
Message-ID: <3b7ce952-d653-4957-ba20-a14f932ad639@gmail.com>
Date: Fri, 12 Jun 2026 21:31:30 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next 5/9] net: ethernet: ravb: Replace gPTP flags with
 callbacks
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Paul Barker <paul@pbarker.dev>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260610102432.3538432-1-niklas.soderlund+renesas@ragnatech.se>
 <20260610102432.3538432-6-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260610102432.3538432-6-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33960-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund+renesas@ragnatech.se,m:paul@pbarker.dev,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:netdev@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund@ragnatech.se,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sergeishtylyov@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[ragnatech.se,pbarker.dev,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,glider.be,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergeishtylyov@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ragnatech.se:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D12B67BC95

On 6/10/26 1:24 PM, Niklas Söderlund wrote:

> Prepare for adding Gen4 support which will add a third and new way to
> interact with the gPTP clock by replacing the flags for Gen2 behavior
> (info->gptp) and Gen3 behavior (info->ccc_gac) with callbacks.
> 
> This will make adding Gen4 support cleaner as the code will not have "if
> else if else" sprinkled all over to handle each generations special
> cases.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Sergey Shtylyov <sergei.shtylyov@gmail.com>

[...]

> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> index 013ced6dcf29..70bef3b31d38 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -1034,6 +1034,27 @@ struct ravb_ptp {
>  	struct ravb_ptp_perout perout[N_PER_OUT];
>  };
>  
> +/**
> + * struct ravb_gptp_info - Platform specific gPTP behavior
> + *
> + * Each generation of RAVB have slightly different behaviors when interacting

   Well, I haven't seen the word RAVB in any Renesas' manuals, have you?
   I personally prefer calling it EtherAVB; the manuals had "Ethernet AVB", IIRC... :-)

[...]

MBR, Sergey


