Return-Path: <linux-renesas-soc+bounces-33633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id saTTF+zqImrjfAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 17:27:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E930E6494CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 17:27:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Z8CJwce4;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F161305D9A6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 15:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7E047ECDE;
	Fri,  5 Jun 2026 15:19:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE454192E5
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 15:19:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780672797; cv=none; b=cGo0l1X3mcvghI9PZyGr/52ohx47ey0CtXkJpVagyrdhDxa6ZwF1HMnJDtdnjom7PtOrvEBuIJysNS3z5Ud+CrxQ1BPD+VpOqHcQfXDiEqMuNFIYuFl8fIJN1TLtcKPnoIyGjcr2BgZ+TPhVxPwXappzHlonXjeZzPa5W6w/2J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780672797; c=relaxed/simple;
	bh=F/91aYGOp0TA4Df0ndhGc9g7+0e11u48hDY7fSepMX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PUVRLTf5rzfoOJUpnS/QsDnfMd1oeFGYld6AQ3QwQ6TaXCYT034vs9n7N6W+RD1otAcT+ibe3ZHAWYmQpHWhcFbe6CVYvhtVwGl1GnBRkYlJNQkevi4iS3VdkRmU/hDmDuNVPQQiCENX58D5/20okERlC44AUNp/0Zj2Ni71Z0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8CJwce4; arc=none smtp.client-ip=209.85.215.169
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c85a2c012e5so801673a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jun 2026 08:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780672792; x=1781277592; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aGW6DwMXILcfqbxRFQDtqjBCL5eF+tfSt+H3qYqWsKA=;
        b=Z8CJwce4Y6p7prb45arq2c2BcGQyHxs4FIoSeJrofc5Btr0+RireAz4EE3S/6ggfWP
         hb8xS5RbJb+lc45fOBFi+kTjjknAAjRLFLTcdKwiuicAAWDjrIq9PqfGk4MtxMBMazjw
         n316GssjYYhk8aISl/FEW/ZlMn8VWDqSh66NRBK5zqb23tnbVg9nsgZ32AAH0JaEGJQF
         rXLO35nK9ZD+ZzuOnHBO6L/1Fd/n+DRvp2REq6ATSRHxkAdtrLcVzkAcAuwd/HEAHpg5
         zJ1uV7KVJnI5SlZLjxhChhcC4N/7P2YIL+jIJ7nmHXhQcr/jO3iCc4Q7qRDzFpH39nH3
         r87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780672792; x=1781277592;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGW6DwMXILcfqbxRFQDtqjBCL5eF+tfSt+H3qYqWsKA=;
        b=VN63vX+nlFuPL0OT9oTeNHSBsuLJ9GQ3HGXbfHUsq+MWfwk7P14JaT2dEFa3hrFwD9
         pB4TAm2AftBzYvhrL9wQwJSl+akoWIluc19V76TYcSZ+ekH3h509SluUjwt/nxEHdLqR
         7pVTvOH6a6ffefq622bnpmDPXbNINUboXKNSedMR1skJ1vMm3LKrlYqB64WG6PrfYfw5
         f76LbpZFyXFgA9gO1EbCTlk15jmtTSTQwFRnCB7qAiofXDGHSBZLf2bZdKnL502XnkQh
         npmxTZP7skFpRzVrQ/R7WynKuapxD7XLW7dHGRDFHU07Dw4KYaEsySrss6QzngcdlW6g
         tRJA==
X-Forwarded-Encrypted: i=1; AFNElJ8Qk076PK99xdxTNUkdnrWfSWDQ4+mdX7UU7gXgsW/ZqyjeritLo2JUUWNetsODTggMKezmaM9WLVkl4SVCKN6rJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXgJ9POsAD4ovN01MjtBlpze4dgLAwBU1SywYprtA8S4B89fu8
	7Psa9U8O7v0SljZO+fUfopnY1dCFXuUUbztUuAEXbpCAIyoGvB1lkL5x
X-Gm-Gg: Acq92OGjKGDB66Upu4drlTeaa3P6otzB4DKbTxY7iiScu4QG8hWvnUKAKgL8l+c7TVY
	MW5EW8/BdITMM7Z5MOLcPpiF9kI365PsZY6cDOgdJn+bS5ZSPpq/cBymaOnmPcrUNk/0hU2bSPI
	NFto5SVTxOqJPAy2FUvme/oLMvQrJTJOPVsozXwegFSlxA3M6MufWxnRb7BocMBAZs3OjU9E/aq
	ZDvgfaY7QSvjRmPJuIV21mkgPS60gki1OCPdSkrhXIYcdIpSH15dBstdl2DZ7Ai3uUR6zSx2MqI
	koQAArR5Tz0it6pqKQoDlbOUxMLawFC58vPr/9NIG5CR1ALqxKm0opW5OQ1yAMEWHNGXKcHD8Tr
	qqIcXiF4paJJwR4ACTXTx0DddS1cLOXewWrUPygWGhlNoIlFkQbfjAvsFNUhDXbqbjC+CqYyshi
	s9/kRb1LTFn56O4EcvgCQ05wDBnozdz9G+wKGrOlfe02MDLffL5kPPRaQztQlUViixcVckdzESs
	A6kUVFdwTICBQWhJse271I+WlD/
X-Received: by 2002:a05:6a20:7289:b0:3a2:f7bd:a9a5 with SMTP id adf61e73a8af0-3b4cd040147mr4994963637.38.1780672792015;
        Fri, 05 Jun 2026 08:19:52 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0be0f0sm7954308a12.30.2026.06.05.08.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 08:19:51 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Fri, 05 Jun 2026 23:19:47 +0800
Subject: [PATCH] spi: rzv2h-rspi: fix incorrect readl() accessor for 8-bit
 RX path
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-rzv2h-rspi-v1-1-c1d5ed562249@gmail.com>
X-B4-Tracking: v=1; b=H4sIABLpImoC/yXMQQ5AMBBA0avIrDWpihJXEQvawVggM4gQd1cs3
 +L/CwSZUKCMLmDcSWieApI4Ajc0U4+KfDAYbay2OlN87mZQLAup1BXeJ7bo2txACBbGjo5vVtW
 /ZWtHdOt7gPt+ACaDeUhuAAAA
X-Change-ID: 20260605-rzv2h-rspi-3c8dd168fb72
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780672790; l=1014;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=F/91aYGOp0TA4Df0ndhGc9g7+0e11u48hDY7fSepMX0=;
 b=HepSfuexrpj6g8kfJG5KY1eSs6Sp3+IaYBt5zzn/iDBlV1091dTONl7FFS8zbuFSKE1k4oDhJ
 7FcKOIxWMh0C7yLiZT0SnEVc55ARLok0i7Q8jWA1uz4tJpU2aKHT9iF
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33633-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fabrizio.castro.jz@renesas.com,m:broonie@kernel.org,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ustc.gu@gmail.com,m:ustcgu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ustcgu@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E930E6494CF

The RZV2H_RSPI_RX macro instantiation for u8 data incorrectly uses
readl(). It performs a 32-bit read which can consume excess data and
cause corruption.

Fixes: 8b61c8919dff ("spi: Add driver for the RZ/V2H(P) RSPI IP")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-rzv2h-rspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-rzv2h-rspi.c b/drivers/spi/spi-rzv2h-rspi.c
index 1655efda7d20..1406885ccede 100644
--- a/drivers/spi/spi-rzv2h-rspi.c
+++ b/drivers/spi/spi-rzv2h-rspi.c
@@ -137,7 +137,7 @@ RZV2H_RSPI_TX(writew, u16)
 RZV2H_RSPI_TX(writeb, u8)
 RZV2H_RSPI_RX(readl, u32)
 RZV2H_RSPI_RX(readw, u16)
-RZV2H_RSPI_RX(readl, u8)
+RZV2H_RSPI_RX(readb, u8)
 
 static void rzv2h_rspi_reg_rmw(const struct rzv2h_rspi_priv *rspi,
 				int reg_offs, u32 bit_mask, u32 value)

---
base-commit: a225caacc36546a09586e3ece36c0313146e7da9
change-id: 20260605-rzv2h-rspi-3c8dd168fb72

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>


