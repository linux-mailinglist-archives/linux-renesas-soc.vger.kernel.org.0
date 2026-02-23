Return-Path: <linux-renesas-soc+bounces-28413-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJ+MBe2OnGmdJQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28413-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 18:31:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FC217ADA9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 18:31:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDF323028F5E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 17:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0742331A6A;
	Mon, 23 Feb 2026 17:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="RdWOf4CJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f225.google.com (mail-yw1-f225.google.com [209.85.128.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7646626FA77
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 17:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771867872; cv=none; b=KRqK2i+w1A7g9Y4whuxK+8kPpNxo5ZFxKEccXWXxEPJJHrOu4G4pS3VS/yVmJLTY3YFEaRcjG4GGqmKRvko2EX0ABhH3jFJ9sooJDyPRhTU89sQIOBTkogCzx+Oo37e0zPa9HaAY5ljGaXh95CjmxCL1W1Zx0WjUmxxBAwpFGMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771867872; c=relaxed/simple;
	bh=Qzxxfb7kEku2747lmzT1fwRiAYJSGvUIx6A0aGIdbAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P0qaX1PBSiF2NTnQL3ne/nA4Lh7dN46ec0en2nAKed+9SR6241aqp4iPFVzzN/umD8VQYYpByGtpb2utfQvCyHlMXUH5OrOFyRuLHQ6dr962YfnKEwduvMq1tBWhkoZgupSKgubxwqhO+4UdY/AFX4aSIThpTsdPCq8n+43KBFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=RdWOf4CJ; arc=none smtp.client-ip=209.85.128.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-yw1-f225.google.com with SMTP id 00721157ae682-797d3864d89so43865417b3.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:31:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867870; x=1772472670;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y8V8psmXfo8hyIGZcjW58KCT42psor/P8r1YSImT3V8=;
        b=mb+yNGrQhusSgwtBzXbNbelbZfAr4Mmkinz+qazhomVfCwQVUBvHbjWWFC7iEYNr4Y
         tLT65C7oawN1/ZctfJCVwpE0dyre3DUbAtn+5agXQgX7n1uos+lTspgI1mNbG+j3w1HD
         FyCm2QaC1SuwA/Tmc081BQsqthG91qZ7msPDTMdoPznNjYQq8lA1s3aplCgdsZKvuRL4
         lot1v4Td6YWmDfnvIZcHI8kLKH/isyM+kzRCFgbkUsKNOinXhJdPPzBhZEPVfWdBpJVd
         3WL4YJSLHZRvPnuzY7fmM2rpH+R5v9HGUe+/uhdyz5BTV3kERrYpJj1UZNv+6RUzCkUj
         xWyw==
X-Forwarded-Encrypted: i=1; AJvYcCURFbUKYx7z9+60Sf/8PZkUWvxmYt/7OuvjzJ+4Y1IlytpxLMBzllxk5Td6SOzptldKlN0Hx7Fkz1RSmX9lpNLrDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRdO+YD0Cyu4t8HHY3y7O7B2fnAL2wj64H75PZ0yKCY80H4iWb
	656dyxGwK+RCx+GaqcN0X1XnaU/z7XaQJrTfXw4454bkvVtWJOGTAJ3UjESF6jKFS4uEFUAXD0L
	iAZcPk6uP5y+34xZnp9JfMTjE+tJnGcmFFqedCdhq6SHim+lPO0tfZ0nr5WUmyOb9PBIWz6cR9G
	RX220L4aMa7ANkmcp5OVBtLpHQOA/bwUqYCKmzA1/QVcEzbckGL9F3tYr1+ETbcytdfZCRdm4s2
	BduyZtoX/+27mKquXq92UHsn6nCcNg=
X-Gm-Gg: ATEYQzy1lx8bM/ZZPDTSH+tkwXrkZ9n9yh/T9brlHMcJVYBK9Hnkhyi8KGHUJhkjQu6
	IA0od6x4CVrhbTDzbAcnFkYcMDuO2Mfmyw2A9U6m0CHby6GYciwCU4MCxTULb2w/8vSxTsje8Em
	l9lljwvH6vamOUDq0p49u6u82/I3foOrBgEoLp1P5gK8aJxOK0GtY1grxW/0jrEsNrgNdtan+js
	6XT3U7Cjz2oIK/He0p5mnuAkA0jm70/G0jtb06NVhMv7sD1MwK9jzDigsEGi4BZlthK/uw1EVLj
	fXENRXBaBLIu1azlWvbVTiEyDq6ikrJh8HSS8kjy4e78gTtgiDCWdCXsyVQn60pyT05polT8X7e
	Z7fdZgJPQ/T6zjNHfCmbxchhcIuUXnJowAZsoy3aUUVbGi1rmYi5bBcH0t6l/zc/NCoPbeDe9/8
	LtXHGdagNrU06M8hERL9R3WTRMTQk+6JOEln1bKvYj9CYvBj3NcRdb2w4dLNs/KQ==
X-Received: by 2002:a05:690c:c513:b0:793:8eec:3a85 with SMTP id 00721157ae682-79828fe4f30mr76887727b3.31.1771867870220;
        Mon, 23 Feb 2026 09:31:10 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-95.dlp.protect.broadcom.com. [144.49.247.95])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-7982de1ca05sm9679907b3.28.2026.02.23.09.31.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Feb 2026 09:31:10 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bd3bf5dde4so4339677eec.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771867868; x=1772472668; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y8V8psmXfo8hyIGZcjW58KCT42psor/P8r1YSImT3V8=;
        b=RdWOf4CJC/HItBSkkGMrTuzzmsKSSoMF57Xk39SOYkDXFODinpm8ZKBs5RKrCpDZNf
         gHpamPGu7JkrEz8aq2UZVZdddaxL21CWNmfomJZz4F9mlTi6pr9wSYdgPhRF/A31r/2p
         ElO0+fPsmauNGsJheejJPALysHZ0WFtqv2GMo=
X-Forwarded-Encrypted: i=1; AJvYcCWZO6KYXF8Sj//g+B9VZkIIkzqIJ1MvzH6b4i1aj1dmt69rvV92JvBQQl4Yvi3onQdnTG/gREpYwO2zkzmrKz7jPA==@vger.kernel.org
X-Received: by 2002:a05:7300:6144:b0:2ba:8a46:142c with SMTP id 5a478bee46e88-2bd7bcebdebmr4905298eec.25.1771867868441;
        Mon, 23 Feb 2026 09:31:08 -0800 (PST)
X-Received: by 2002:a05:7300:6144:b0:2ba:8a46:142c with SMTP id 5a478bee46e88-2bd7bcebdebmr4905255eec.25.1771867867664;
        Mon, 23 Feb 2026 09:31:07 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7da3eec5sm5168891eec.4.2026.02.23.09.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 09:31:06 -0800 (PST)
Message-ID: <765a981b-8ceb-40f2-b033-2e6ce529cc6d@broadcom.com>
Date: Mon, 23 Feb 2026 09:31:05 -0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] i2c: bcm2835: set device parent and of_node
 through the adapter struct
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
 <20260223-i2c-adap-dev-config-v2-12-d78db0a6fcf7@oss.qualcomm.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
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
In-Reply-To: <20260223-i2c-adap-dev-config-v2-12-d78db0a6fcf7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28413-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:mid,broadcom.com:dkim,broadcom.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,sang-engineering.com,kernel.org,broadcom.com,ti.com,iki.fi,gmail.com,atomide.com,kemnade.info,baylibre.com,glider.be,foss.st.com,pengutronix.de,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[broadcom.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C7FC217ADA9
X-Rspamd-Action: no action

On 2/23/26 01:05, Bartosz Golaszewski wrote:
> Configure the parent device and the OF-node using dedicated fields in
> struct i2c_adapter and avoid dereferencing the internal struct device.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

