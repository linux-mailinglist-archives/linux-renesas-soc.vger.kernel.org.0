Return-Path: <linux-renesas-soc+bounces-33735-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qwNSKEjZJ2o13QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33735-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 11:13:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2083C65E2A1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 11:13:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YLFP5dU7;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33735-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33735-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A1623118F79
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 09:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4256E3E317D;
	Tue,  9 Jun 2026 09:05:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2700B38AC88
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 09:05:54 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995955; cv=pass; b=rEH6mkHPsfzTvJd7Wn4fM6suvbAqgA8cHSbGR4QtWdg3ThDqXLT1jWXFUbx3g/wVzZpfQrRvMdG90JIKlpJLcZHzS7JxUft/JOf0a8UWlRRfdzCvk3vfZPIYBcvRqX9LMrqQk1wb0JRImYIWI5QfaAcdAepdGHAIpF5s3NProI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995955; c=relaxed/simple;
	bh=Arb3l0apixT51Ws7+eo6cRWV6eNyt0ISkTNyCaaADIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dYmQ2/7PrFGC7q28tMaOym1vAr57qjO01oNUQuaGODJcBbHwC3TLdaGmKeV3AeQnzaJ4TfPto6ACuMzph8duLevsPi/ObiDkD4OtN1MO8kLIGoBi7iBlHjDz6YxT1goyXzlqU3ILV3X0PwwkAzulL5yQHxtLvlpsC8aINTXXExM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLFP5dU7; arc=pass smtp.client-ip=209.85.210.170
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8423f1d8902so2186980b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 02:05:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780995953; cv=none;
        d=google.com; s=arc-20240605;
        b=O0kTCrCJQK4cVZY0RltuM4g1+53sDeat1LfPWXgzPt6+WSb1/L1NEzuLcut6Yep6wE
         1FJ/dM7fGhTePniBkm/w5hbqGfE5Jw/BICjFa5zTpVp8sRGQD/O4rcBq2esV1CRYqE3v
         C8H48UUSvrs7rgnLz5U8ueIJ2Vus9ZUJZ/htKA1qTSD4KgZ9nwoyVY3EBvJR6uKn1kY5
         SbNpwsAp1r+QE3pZXd/ap7odKimZUXhIJQTgJZrlimgUu8FnzpAWrkdApJ/dXjg4MznY
         IQctBEZ0T/fW3xUofmoS+3b8AJEU6PoLlCp00xnyEhxd9Ox10bk1FCFkE4XIHNUSqKHS
         UNag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Arb3l0apixT51Ws7+eo6cRWV6eNyt0ISkTNyCaaADIQ=;
        fh=nnhTQWl6OofP0X9pBzJQHPsL4724j6tkApaz6wl1wDU=;
        b=XIHtnk2qQzew1v7fVwifbKiy9M6TlT2lVyy8rn9sZSwQlU5+UmbA7UckihcSEgnxm4
         iJyMZ193ZEHrc1Ton2p56PRtfX/eYeyBnmnveCARCkx8sdQO7HSOX74S/2e6OFmU223h
         yZCdd2FNWNnTkyaJ3b3SBnRYBjk6RSwJ6uPj6+AIz19WHUp/ojKRSxFlGh3evHDrpue6
         WQiRrH1em0d8Ln/umYUzitlTc94Ln3rlFqofB9qKqrZ8tNl0Fq9Kc0zKpPJMM976uC+7
         RbAP5mYW5jAoHU2Ce/zebD70xma0L7rIrKoOS9WyAnoM/PpwQW9umh6QlUXnnaNmgusD
         5Rnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780995953; x=1781600753; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Arb3l0apixT51Ws7+eo6cRWV6eNyt0ISkTNyCaaADIQ=;
        b=YLFP5dU72+eR5ojwV4xaHmL4Dso7O4lJzTJZ75n9R6BizL3klJHu1pop5GIrA3AKIc
         gaTKtelrPVxhkrTpzIK75mDOI2BYlUvjejp/A+zalPTS3QywffToqcL0Nasxb37RsnON
         EgFh1hfJXQEiHDm0L8+KVscG/3whYm72vSeQwySN3Vx0Q9wnfne4VXwehDcy6vUJDWsC
         bVR7gi2JUaPtsjdRroZ5X48OYz4SYu3j0W2+F3BAGNKzJtFkz/BnT/qoYbdOyq7XQg/T
         sl5nsc/ILE3oOiaLa0UYaDow44NwBQ8SBppOj6VgfwY3KbS0Oycp886y86+Z3pNfJMi1
         b3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995953; x=1781600753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Arb3l0apixT51Ws7+eo6cRWV6eNyt0ISkTNyCaaADIQ=;
        b=GERZoA5rcypdzBsqXxR3bDyFXsmiLNhIvj5NUqMmFoe3N7kfCqGP3i0vzYenifUX/U
         DKDdoLktMrKuqexZIlVZioFS8pt2xtthW3tg3LLT+GMhXat2Tlc5Nf2LOaxFV2bkT442
         pWj+aDQqKpB4cbCLYwZwiSGS7iDJO1l/IgBZDBoLC0vEKO0ZNQVjhRf/wut3wopzI8AK
         yMAtIje3I6q30qwoWi54B8maUvImcXpeMD3SjQ3dOjaH01PVygJh0AtRPpCdrg20JMkF
         xX7bMttWfoOXzqQ4vShzd3fIe1AlxzujAmvY9m8v5NAXwqDMuBIvvvJUtu3kDu5im03w
         v3Lg==
X-Forwarded-Encrypted: i=1; AFNElJ/EUS1ZVLr2Y4w+KKGQcuzl0Adg57pNOW6TylfRAf9jtfFvnKYig01uAipkoiGLEIl7bVeOwOy+uo0MhA7dKeOCtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDzSNv4g++K8FG1mcWF7ijl0KBi7TbVF49ZiVGc1Nc/FbNO/ym
	9eWhvMP1Q4jTqcPsUw0V1pnXolZ1jSJMd8Lyt4b1sS3/Y1C3rcO6A34k1YHSOsXP5IkOMZ1Apm3
	VUiEhfH6N6bC2+FSUQPbc8X/B/NjJrgU=
X-Gm-Gg: Acq92OHycUB+/9cY5KlR+AovDHE59JHset0ZrewHYkXDENBkVeTyMXKslejYlPA+Azn
	Vsz1ZhMaO5UJ7MRAsHG6+st+qg0+MDW/lL1KwsVquyxdXRavlTP9P/4hSYDVn35dvMBlTGe4G/q
	LTP7LvmD5RLEIrxU9YVndk7D9Ig3rz3j+ZY5Gs4hs8tD57Zta31BHQhTxVtiCmVCaUzSbWE1yT+
	ZYHzqAlBz8gbFD8gwNAF8KiroFzkH1NxIyKB03ukEbQ1F6F40HmR7ulv5GUBBykRJjcatDz5FgZ
	BdB6LHegldsTPZShP0ffsPIf6WBNjwekDGwkm+5gDM5lmNS6
X-Received: by 2002:a05:6a00:ad5:b0:842:2419:6c0b with SMTP id
 d2e1a72fcca58-842b0e11c7cmr20087951b3a.10.1780995953465; Tue, 09 Jun 2026
 02:05:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609013107.5995-1-phucduc.bui@gmail.com> <20260609013107.5995-2-phucduc.bui@gmail.com>
 <20260609-nimble-guillemot-of-karma-bef5f1@quoll> <CAABR9nF6uhEyCo-6cekhKwfm3zkqjXCpj2O8C8Xk=2Frw0arRg@mail.gmail.com>
 <6103e3fc-4b27-47b5-aee9-8b481759eb65@kernel.org> <CAABR9nHBA=sZsw54RWMCg_xdDCeo+stnSYg6yACfzuJoMNMyPg@mail.gmail.com>
 <d610ea66-23b0-4691-a0d7-6a32e42dd902@kernel.org>
In-Reply-To: <d610ea66-23b0-4691-a0d7-6a32e42dd902@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 9 Jun 2026 16:05:40 +0700
X-Gm-Features: AVVi8CdtFgeretXS95PDA9wmrlEPo8ic58fZAHHdjLlUvl-toQFSXd88bhJWIb4
Message-ID: <CAABR9nGS_Rd=tCjhCDu8EDgCLnx97mM1nqGbquHXV+mwuUczYQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33735-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,glider.be,gmail.com,perex.cz,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2083C65E2A1

Hi Krzysztof,

Thank you for the clarification.

>
> Odd. clock-names are string-array which has uniqueItems by default.
>
> That's the first need of usage it, so I think you should skip it even if
> it does not work correctly - the true fix should be in dtschema.

Understood. I will remove "uniqueItems: true" in the next version.

While testing, I also noticed that the schema accepts cases where the
number of entries in "clock-names" does not match the number of entries
in "clocks". For example:

clocks = <&clk1>, <&clk2>;
clock-names = "fck", "spu", "icka";

This passes dtbs_check on my setup.

Is this also expected to be handled by dtschema, or would an explicit
constraint be needed in the binding?

Best regards,
Phuc

