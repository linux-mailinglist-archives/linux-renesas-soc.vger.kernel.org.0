Return-Path: <linux-renesas-soc+bounces-29857-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMyREqG6u2mtmwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29857-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 09:58:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D39D2C82DF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 09:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ABFE83025415
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 08:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6457F3B2FDE;
	Thu, 19 Mar 2026 08:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZYo20634"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3CE3B0AE4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 08:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910520; cv=none; b=VdwcggSsmwgA8/bD0qVKnBhjOO+extlHP/C0z7fQ2RGqD+RuOS+I37xWhdLqqOYQ40PxjowNNbwCjxD4cWCxMHQmIMDNxCW59KF7OhqVZNsjPWVAkcFTAuvr4P6c22ffKCyTyTe6mlK49pfk8cVC+i2VwdYjPiZjDKGMSn9bEec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910520; c=relaxed/simple;
	bh=5XxWigC5My4B3x24Szv6ks3z8EguLjBpSYctWIzjgW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AbzbClkwt2hfMR1h4LOU+q6Pmzf4Ndzo2imqCZXyAN8aIL732DOr2E77KYDlbCV7PxAuHoW9zn1C4MU6WkzsjwmpMu/ZW7vwfWMf4smrIOYuQbaO3FXWytrPnASLZIILZNAHa9wUGjIA+mgMcZZgbnksTl1HMAY7RvjG6STw8aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZYo20634; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so455469f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 01:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773910516; x=1774515316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8swaaNWSl9RHsLGGBfu8B3B1mvGualJmPbpF6pl4oPU=;
        b=ZYo20634g1jYb89G2/6s6kncGg01GNoTEUhcFAeTMi209owQ+xqEsueeYh5hnXLuUg
         mT3uFkENCMjfxaCq8YKPo3JAADDBhrgtfC9r5jsITpgJgk/RjF/VCgKFuPhSgtYoyjn2
         qFlxPBGgcsJaPAUO87bU/COL7jMvT510jgiGXAKdZ6anoc8QNlGNppTwVNJr8gO+FEx4
         ESMcrgIep7lCK5nKV5uymTJmw+LJpwsmmBsZ2uJgVKXKKon+I8/a/Egiv7kzSZoHLpmX
         FQkRdNo8AP8ysi3+mZEE29wOmBxFCfvk4nTfqXb1Tn1l04KRuNJzyfkyGk8bq9k21UKQ
         v9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910516; x=1774515316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8swaaNWSl9RHsLGGBfu8B3B1mvGualJmPbpF6pl4oPU=;
        b=sTYgunLzUbrm1oWjORLECqyz+bCkkCiP6wM9zMoq0LLUfAB3/7liSFhGek2oNhTbV+
         GRVsXskXEoRnnR7zhNWQg9kexpIS7fddHIWUIDUCfj6B2wA5kaEuLugo/oOEg1oPhKqo
         bN6eRc4xZ5iUGuhekaYZXoBmOD1UVZl93tUhxat07IRDZcuDZnEtRYDG8bQ3hyk2Frau
         ZrRyiRC04kjzFj+/3Ad0flvvcMZTX5ju8NbCKUiBLdF2bgVdyA2tCxBhBQvWPbaeab0w
         06CI2ubF8VbSlYDqcs8pm2aNHKCYL5xxNAzwpZo6CSWCbrb4CN+IGpZff6g/Cso2LV9H
         9MUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV0FRz29D93HxCXthB2uJ4NW2ul/n99FlTw4P+pePGNh3n1YNL00SajTIrVRJ4UjMLY3TYkLzCrl0GGFv1YKrC8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3RJ2U0rL/nHvqovb1+ei79KS7ZQT9M1X4YnIhWiJMH4OIGM31
	yNJV19EJ05F0YW9HaW7z9haXOUfV9jdT2hnLTCOKTTUNNbRNlwZ9N8aXEPwjIpTUov0=
X-Gm-Gg: ATEYQzycfQK5ZLTA2xjWRRIhtFpGIz9XdavHiqiTjx1ZsodVsP5U+oPHOqf3SQUv5VI
	cFmop2lUqYR0fse/4mu0otYXNae+/oIO9/sjytaWdv3YC7wWeGmBzvINWmvKhILAmisveIN6jaS
	BSVUcZlWRuTtR4pp4rXl3k6pKPM5T8wFkKXSIpO/WQEJLtXZRl826R+51FaHzrK8tVMWTVdvDPk
	eEGJwwsA3f/FX8W5H95NReI6T/W3agtGCcCVSQyJ90LnjX1FHZRqSJ1DTwuaGVVMyArAemtOY4H
	HgvIL/j7/NAIcWAZLv+wtIAqQccA1Qs9tOfn9Vzz63C8xP+wplwktF3rW2qnQ379I4bHCiDUgDD
	I3Wg3S+CkF5KqIq4VDZHl1g3ZgQYnEfSo/eCu4MmqZ0gXBsMEfaNBYItoxapj4iNjHMhkTjqWo3
	5CpUR9qOft3OT6Lg7lFZ0BTPqkzeKBGYGS+LGWyXvmKqDe
X-Received: by 2002:a5d:544f:0:b0:43b:5762:298f with SMTP id ffacd0b85a97d-43b57622a4fmr3176952f8f.36.1773910515711;
        Thu, 19 Mar 2026 01:55:15 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518588a0sm23072267f8f.16.2026.03.19.01.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:55:15 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 19 Mar 2026 09:55:09 +0100
Subject: [PATCH v6 3/5] dt-bindings: arm: qcom: document the Ayaneo Pocket
 S2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-3-797bf96df771@linaro.org>
References: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-0-797bf96df771@linaro.org>
In-Reply-To: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-0-797bf96df771@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=763;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=5XxWigC5My4B3x24Szv6ks3z8EguLjBpSYctWIzjgW8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpu7nuLW6CFzyeEaURq0TdwKGR7x2YQyIFu9wrygmk
 /Un4k+6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCabu57gAKCRB33NvayMhJ0WZVEA
 CE0nSlAt+Tnw+3tKQyLV56hWvjVI/qhzfRru75asl8IggHQfFCgtY6eCcoZOlFa/J3JFnJcAQ5aw7E
 SBB1lPVoUSGfZIKS9MDaCxdqozFEsQ3vyt3wabS2j+F8wSa9NBnY4bmfNwhnGbXUNBQYC7O9OQ/Lut
 MyQG4xe69TqFxzkxgg2RUNtwahV6YTDWMlQ7RyAOaag25QK7MGlb1siTpZmaAuo9BnJzOE6K+1BQFI
 v7tj5QUzA3Ec8h+p05oZ/nDgBja+jM5xNubVbruuz5zmx0POC3z6hm7dn2hqIxl6MNq+oZg6O05UWH
 QNKpwvtFkWfOetoMV3/580tykYz81PjJAYkKnBIpzuPWPAxqQHnI70Bv97AERG/ltEM0bKq4Mnnd0M
 ++terUMijoWU7iJSlkKmGFGqhFQ9Il/HBsdFUz06hh+hh/jbbfhBqT+gbx6SfsjTQEn4TKfXh+TzRY
 c7ketgyw6H+/VuFmSB5lj13LT9UGkVdmNQGQYdSzfbdTYd5+Q+Wu/te/wL4j5nsYiO66LskCg+2qQ9
 i68HG3ckbgJx0EF/FoDi7fUQThFQqEWqSxKlMMVTfpKlydxMDdfMm1gMlnuKV9OcO/yFEFmiS7UH1r
 7kjgTXBpwbIL935kyHICiKGkGCln8IGqkcspgT9aWxXq0eUo3dN8BlzK1+3A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29857-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 8D39D2C82DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the Qualcomm SM8650 based Ayaneo Pocket S2 gaming console.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d054a8f5632d..0a6312b15712 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1077,6 +1077,7 @@ properties:
 
       - items:
           - enum:
+              - ayaneo,pocket-s2
               - qcom,sm8650-hdk
               - qcom,sm8650-mtp
               - qcom,sm8650-qrd

-- 
2.34.1


