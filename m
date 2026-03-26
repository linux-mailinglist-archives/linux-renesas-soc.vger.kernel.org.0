Return-Path: <linux-renesas-soc+bounces-30341-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOOcKt0uxWnJ7wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30341-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 14:04:29 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 881EF335AD2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 14:04:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F280A3088EA1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 12:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE43248861;
	Thu, 26 Mar 2026 12:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KQhxWVqm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2C629ACFC
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 12:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774529773; cv=none; b=K3B/FGVnsda4Y+lIUyPmE375ek+Wt1kK6hMUKymKGxitB+VVpGVWRlwdncoVL1AogsDC+L9VEw4wqMCammoFDY7tXHVThl8bauS19u2LxYcBCGL3Z2e9e/GeINWDAOnq+DJwNSvsguINBx1yUVermvlYc0dCwRh5lN6Jg1ujugU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774529773; c=relaxed/simple;
	bh=AOyK9K7He9jaWEQcI0TLML2gpG/QGkSkNBxuQXYT1yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VBt/tA1PQDZ69fpc7lymuAD5yPlK9THzJidaCXcSkyOyoiEuvKYVG2C9FKxNf4fs4gbv5gjL+rIMtwSOTe5PKz7ncVLza3g2OgUasMdqNg/yYfEwBiTm+q7kKqk/poGsTAoqPRJn6Oj0kkzVjs4WDOjf9x6BZ+beyNGys5bGtos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KQhxWVqm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486fb112c09so9564915e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 05:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1774529770; x=1775134570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v53LCrPXAsR6yI+88VBtN+4JZC9PqA7W1DCpmW7oQMM=;
        b=KQhxWVqmIDKZj8pG7iMOWyg01iAWIJGnIXDPbSc6mez85fbhulOa2RfJStsIfd6irK
         +8lwYtZlzdL0gU7qZ53QUXfPbgAFP6dfXE79KezzfGq7S8W6y4ABqoSS0db2Q/J7Cag5
         /7F/uWyyp+jVLrNR9msAaMYwgxNEZ9xYFJmIoOQaMocPtLipWpMRvDx+VgGtdN+FGGXM
         dR69jS4u5fdxISlSdAHLf3V+vym9tyfApJARZSjRSL4aNQfpWV5fBEOzDnEBEMEyvtbA
         k3XsHx5/TuvBOBiBtgr5SGM87HuoE9dDXfAiHtsduian3PpW6BtuDtQMm3cn9lrqG3AW
         4vBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774529770; x=1775134570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v53LCrPXAsR6yI+88VBtN+4JZC9PqA7W1DCpmW7oQMM=;
        b=PLP6EuD5m8FXa4aUnXzgMY/v6hUmIxVNmUx54pkuon8gudE8sx2E5SMXMtFRE4NgwZ
         p2SkGvIY9r5Ix2qXabZgWlqP0PIG3Xk9sRlLiyUR7Edvjmwlhfx2rpSOd6EdCg+QTlMg
         yPDFDkK9XHZIfie3ndaWcvgf1dyIBWFoaeLCBgwYkMs8dYrDm+T8kx9nAX7HgXwlTmzd
         V7geEhmh4NmRk/t0FjYWLH+yXOYrN/nMMTPrAWXHUeSu0BAVh+iZ7//tQL5SSCHUaXaL
         jCOChsts/FZRKq2q/E56qIly+ENLa/vzVO4Tr5EQXDlWBG8Ixi5VlhLW7txqs5fjHEjV
         jjaA==
X-Forwarded-Encrypted: i=1; AJvYcCWEv+LO5xts8jnyQqLMoPrNL9sXkAFYLfER9+rpD2UEPZnLj8B1oGIlwqy+dTATHBKfadNlvnvAD+O1Kb2n5nWJRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+9MmAHBcE6ZWMWUQ7sDpTS4gD/vbXM77zG8AYCKI9qJKTcY9V
	UoJuLxlTj/BnPhDRpNlY8h0g7LZ5FuzOMJ0/0wZgxeiy9c1cnUsPzLaPCPqVe75l/L4=
X-Gm-Gg: ATEYQzz1NkLJwkO3dhZZB792vUohCjh/ikQodjYEJZdwTv5//jxFP0g4/07NjYXSOcp
	QWk6HH++e52nP9NazhgawGk88uu2i7OyiVqbewHiUtPAagh830XaOcQwlrXh54w942YOKMaAscH
	HV20QBrauSgVynqXPZsBlJUm5m4tA+ACnwWmPIGg8Z3KhAQxeijTVOYaxQDzBqJGRwmht7hXVGR
	MNtixdDIG70epi0cZlGRTZ3U4PRZYlZNZrnt8wIU9hT1TIoMph+gX9dGidSvmpfr5pIOYrvau37
	S0qXvDFsYMdh8Kxm1KD0GvS6RnXF/OxZt+SedMnYsIVfm9HVIr8HrX/n1DR0DPMSgNDBXaPHbjG
	tmm3i2ABC0YrrTCoJ2C6ghof3B19HYnxJxPXX/x8q5kTswI9WH/8XvvB8KEVie4ZJPXK9gfVoW0
	gMxj7++dnHoaqaWvlZxSNRh3XWN43AE8o=
X-Received: by 2002:a05:600c:3490:b0:486:f8e9:add5 with SMTP id 5b1f17b1804b1-48716042c08mr111608235e9.19.1774529770172;
        Thu, 26 Mar 2026 05:56:10 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c789ecsm28316645e9.4.2026.03.26.05.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 05:56:09 -0700 (PDT)
Message-ID: <693acd52-987e-4018-ae02-386dbd430462@tuxon.dev>
Date: Thu, 26 Mar 2026 14:56:07 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] PCI: rzg3s-host: Add support for RZ/V2H(P) SoC
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 John Madieu <john.madieu.xa@bp.renesas.com>, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260318124450.163471-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <605e8d4c-09e7-4d11-acdb-7829a85eacc3@tuxon.dev>
 <CA+V-a8s_Kv5WwocsKy_qBEtZ=0gzN-YbAz3pYjubf_qZVLhBew@mail.gmail.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CA+V-a8s_Kv5WwocsKy_qBEtZ=0gzN-YbAz3pYjubf_qZVLhBew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30341-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,google.com,kernel.org,pengutronix.de,glider.be,gmail.com,sang-engineering.com,vger.kernel.org,renesas.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tuxon.dev:dkim,tuxon.dev:mid]
X-Rspamd-Queue-Id: 881EF335AD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Prabhakar,

On 3/25/26 13:53, Lad, Prabhakar wrote:
>> from [1]:
>> "For example, if rzg3s_pcie_resets_prepare_and_get() returns -EPROBE_DEFER,
>> the static variable is never decremented. On subsequent probe retries,
>> the variable will be artificially inflated, eventually causing the bounds
>> check to fail and returning a permanent -EINVAL. This would also prevent
>> driver unbind and rebind from working correctly."
>>
> The other alternative would be the below, where we wouldn't need to
> use the num-lanes property but would need a comparison with the DT
> compatible,

Or move rzv2h_num_total_lanes outside of rzv2h_pcie_setup_lanes() and reset it 
on failure path.

> 
> +       for_each_compatible_node(np, NULL, "renesas,r9a09g057-pcie") {

If it's possible I would avoid spreading compatibles though the file but instead 
use driver data where possible.

Thank you,
Claudiu

> +               if (of_device_is_available(np))
> +                       count++;
> +       }
> +       if (!count)
> +               return 0;
> +
> +       /* If both PCIe channels are enabled configure the LINK_MASTER
> in x2 lane mode.
> +        * If only one channel is enabled check the port index and if
> port1 is enabled
> +        * configure the LINK_MASTER in x2 lane mode, otherwise keep
> it in x4 lane mode.
> +        */
> +       if (count == RZV2H_MAX_PCIE_PORTS ||
> +           (count == 1 && host->channel == 1))
> +               host->link_mode = RZV2H_PCIE_MODE_DUAL_X2;
> +       else
> +               host->link_mode = RZV2H_PCIE_MODE_SINGLE_X4;


