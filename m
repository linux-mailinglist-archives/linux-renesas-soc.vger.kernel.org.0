Return-Path: <linux-renesas-soc+bounces-32996-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLh9CA9cEGqDWgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32996-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:37:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1DE5B547F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF6493181824
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5127B3AA9E2;
	Fri, 22 May 2026 13:21:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C41C3A9872
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456110; cv=none; b=lVYZ4zwFd2fWgqAomJCw2ONB/dwNJydidvh4jHY/dOIVpFDn8sD1oYIHweIVMUaqvZDDzSRQ7wyoN1fJgGkIjr5w8d03xIRXw46peIhey1r/b64I1wj245s2vdTVOhQxu6ferF63ouU7F0F5bzSSWY3LR88GlWaqNNi7iPbJi3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456110; c=relaxed/simple;
	bh=0PK4bMqXimU9iNRWNX/eX952I3s/oyh75Caj0sz7gdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GcT/+tvlDh8fj817slz2EHWz24Xi82YosotnNPnVZQJNV63v6gtw80v4pJ0l47hnkglr3usrZbzOLqhUNkuPv9gL5EjFad1KQ8C42JXvHhcYQdvT/LiGIJxI10fJnouPIcFlBbzsynVNDBZ/G9IKywIpX+NYjubgM1h2CbBcCaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bce386d5b85so1180451866b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456104; x=1780060904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=;
        b=H3FBKToM/9sz5ZMGz6bdO/tQw2n6XE9mc7awatTrGayFPCKXnSKtOm0LCVleFqugzo
         BWScoiUCWhm273VnOoxMKfiBkvzWx1aR+beJEdbvhnXXeQx6vVngzv54Da+ddlIora0J
         dg7uBWKeODwFt+Jy28MRRlt2PuQTdZSJ6z0y6lopqzOl6Y72xRpg+9FcfxsWA9WrLxW5
         F5czuqtyPzBl3ER6RjgVUC5LRUs5FC2IXN+daElrmKHHIcgfxi2dqKveNe5aB55kvlLH
         kNCbVpSgXePekcXbLvEFAMHu8y9rVnGJvLDX1QWvU62yZIoAtyY7p08OOm6DWYtmR4pi
         3r1Q==
X-Forwarded-Encrypted: i=1; AFNElJ9i9lXYnPbExDeJjTHYnrt+E6dXxTwI4b/1u+CJttArYB2nWpMzvoDgRBYBvLZpld2YKdcewRks+G6RG/EQsQ6Prw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfruSeJNNdXobkhRNwSze1Z7Jy9Wpq4iJxUrrhJ6S5meEmzulf
	2YeKgUjuI8Bdzjn5UR/T7z5WM9GWQRhxFYJDWEVamISzEibV9GaejyXBhwLg5w/+8KM=
X-Gm-Gg: Acq92OHat1r3JArO+5WyEkvauU4MOLnXCHP9OA3uJzz1dRO/Aw1z6ZgWWgYhXT82+1B
	E555C20KC6rCDElUAExr38Fc2c4QsyYzrQX9whQTw7soAC3OEiWBuGg2ex1rkiH8/FUW5ZxPfPe
	OyAyXb3cJdj9grAO9k/sONzJwNIW3AMe2fgxfnX3vlzO8WfC3tICAIfR9laIFB2qesWqEVXv450
	Wfq+0yfGRnxQu30INJFhnhQsP1CdvEE6+h3ElD0bE18lkYoVpwCOT0ENJTiE/7c/+24haYwOfai
	lNT4aFTL+YRUNhh1e8cHLZo1RzayghJHlwf85S+bmJzC1m8JDZl0R4KIl71ck++RlqeV1kErx9q
	OpPc1Tw7zOSV8KIO/nxV+B809xrsPJPflqumGsGYNT/31KDe3et3HrgBq3SPpFtlIEmw8KnGPPd
	j+LhewpKe5IY+SU74EVZgNR4Yanrflv55qeRIKCBwwru21fZ7UKiAaHRuCzUII
X-Received: by 2002:a17:907:75cd:b0:bd3:897c:7800 with SMTP id a640c23a62f3a-bdd25cee478mr187171666b.15.1779456103989;
        Fri, 22 May 2026 06:21:43 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5ed2d38sm53596766b.34.2026.05.22.06.21.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:21:42 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-676a89de629so12042946a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:21:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ96hRhZJuHuHgD9fgqZT5tubtjG2/8+Qw0+cQOhkGJn1XJBLrWnomNkV8iMS0BFN/ojrIfjuGUKu+1wV3ciz3XnYw==@vger.kernel.org
X-Received: by 2002:a05:6402:40c3:b0:67f:7e9b:afe8 with SMTP id
 4fb4d7f45d1cf-6889c4167e7mr2035745a12.6.1779456102329; Fri, 22 May 2026
 06:21:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:21:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXULb8d60kxa6aOSy=uXhByyHWQbZaEY-EOrFWdcYPaRA@mail.gmail.com>
X-Gm-Features: AVHnY4L5XJ7YwASenMlXUKivWU992B_gEILaXDcRMH1AAUKnrMIEZvkG7w1HbsQ
Message-ID: <CAMuHMdXULb8d60kxa6aOSy=uXhByyHWQbZaEY-EOrFWdcYPaRA@mail.gmail.com>
Subject: Re: [PATCH 04/11] arm64: dts: renesas: v3msk: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32996-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8E1DE5B547F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 5 May 2026 at 05:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
> de-assertion of reset, wait a minimum of 100 us before starting
> programming on the MIIM (MDC/MDIO) interface. Set DT property
> reset-deassert-us to three times that, 300 us, to provide ample
> time between reset deassertion and MDIO access.
>
> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9031RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Modulo the document references:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

