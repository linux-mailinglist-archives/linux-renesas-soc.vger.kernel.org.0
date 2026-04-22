Return-Path: <linux-renesas-soc+bounces-31513-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKxID3VQ6Wl2XgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31513-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 00:49:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 873CC44B580
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 00:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E977307C2C9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 22:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E46137703B;
	Wed, 22 Apr 2026 22:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="xP0Kzkm4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6F8372B39
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 22:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776898121; cv=none; b=AlT3M0kK/VBm7/irpe/sClIEyWxaUyc5LyXmed2r5SKFdHHWjs1wrzEVySwDXojE7lSxJG62rJotUcvSrjU0HUDuovqnSR4fOjJcEwtQpQPYv2RBi952/2qxLR8NoDoWXZuL/+9pEI0TFLtuw+3I/BjhVPjvb8fRpTgAQ0t9vM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776898121; c=relaxed/simple;
	bh=NRWSIj1awYbKDb7XDOAYoJaNnOVQ29rl0pbbuAh0CXA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Vhxn77BmXpTDnu6HbdM4GTMMnFPdC3mA0XMif2R/tLQ+9afQz5e26BwdOMxXc5yachAKp62bfGaqGS3TWsKVKafXgobgIeJz+4dNCSAXoPQQPtaSiPxaJvAykyf6G/Xeqe3pRk+tpSypQiyWqiyWwN955/CrAlJpqPPgKMQI0Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=xP0Kzkm4; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82f1f6103afso2831721b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 15:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776898118; x=1777502918; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4qI6kGELEoPNIDxXAqpiIcX3kz3Y96gemHsRdJV8MIo=;
        b=xP0Kzkm4cdE8FArVwyURRIHBqxgKXjsZXcCImcT9GabegLK8BxG5yXw7MeEN+gWO7c
         2iJgGQFINJgAKN4BIjv2ysJkJXWZlOQxbXwci6oucu29d124FfVSkzHu8hXbi/VexCWw
         hjwhyIsDf6MUPD82KchjGOPlF86Z5AZ0DIdldkzm/ImvFY5UnGqprIWIN/8ggT8MHI7x
         C7bkUNY/zv9Slh+EsjBw7mM+szwXkfl5dyNd+ipkpHdIFjyG3Dc2g+IoVn7132uP1t7O
         wXQk5Z9aE5FO4TfJFxv4BHrYkyNiuRepGZURqK7AOiZEUE8x6Gx8H0zBwRCrirocoUvd
         v4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776898118; x=1777502918;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qI6kGELEoPNIDxXAqpiIcX3kz3Y96gemHsRdJV8MIo=;
        b=lxq6g6yMqUTdKeUa8fkRI8CwkM23rGfK3iq0a5QyddkIxNcrYwSAJmEX4w6yFUAkyP
         Mk3+Inpb0XUiUTHOxo9T1nT0M3oqv8YjQA5aoJD5YXPP3dHL9UBPdRFmRHYAwMVTol1Y
         OzKqHpFI/Qg6p/ebDbSRjGoyuCE5AIrPgJt5VsuYhA1v0pjxtJ3XgDDCmPir4QUT+EmY
         eaLxaY0/9XHbRZMqfmBehOTcsd5gIp3Y6pHEXP+IcUQhKfd2moa4JteMOJPFZybWMqzW
         UQi8EUv0yqFT01ZXm0Dw5K71wwZmNPgcQgGFFOaJH9TfIIqwBEPU8IZxUldmucZ7ikIu
         ZdYw==
X-Forwarded-Encrypted: i=1; AFNElJ8+vAwwTz9ulcCQbpmP30KFaPPj1zK9EX4lVUuHUcN9hcIPTaF37NuFP/4bk+aucmOoGqsvoaKB5VMrOj1gDAwDOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyM1irc7ksj7kzfXZ0XlEb7mV2lMXp2txsmrvwY3YLwtB4RTYI7
	Y36kCDI5GCYIznaV5UXmWdHLkiFT274huHZ9FDShM2vuysIPvG9Kv4xuBP9/BNU5SX8=
X-Gm-Gg: AeBDieunEx5/pbf0p8sOKjgkIvW/8bwWWm5nrggyST6L38LDLnyKYjqBUaqZSuxlMME
	kgnfSEbak6RaSwTrFS4MEtKy15yUIN3mLySjKAifmdRUP2ytDRZplH8wgYTA4OFA0pwMsFE3d46
	bv56HpK8TS/4zirf90cRZ8Y0X5n7EdEZ/X2OkyZYXsQNk9yYSCmJWwTP6MAn+hgPfOpKLVvm8nv
	2/PLQfDwtEUQyxmeP7qL0ElX1fgfAiMvJOEdvcOSrxA+5LN7+Wzmp3siquDZsDv4EH9rbaFej6l
	E/ihRCrP6ZVnlrKCczhDSe7pjLmxoIKM0OP55amfG2bCpSD0XIWI4A+6WAbXVk2vVmNPjzshsCl
	ck7XYPnxEKWZoS+qy4PwlOl/EhGD6KweFKzuI3pVYHkWcMTfzoMUYXeQuqyax6jrSP0V//IqWmy
	JHujsiiMX0SGbXKq7n4csmiTxcw+ILtw==
X-Received: by 2002:a05:6a00:c8a:b0:82f:98c:1465 with SMTP id d2e1a72fcca58-82f8c8fb258mr26682792b3a.27.1776898118539;
        Wed, 22 Apr 2026 15:48:38 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec04448sm21836313b3a.55.2026.04.22.15.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 15:48:37 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Sudeep Holla
 <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Saravana Kannan <saravanak@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Marek Vasut
 <marek.vasut+renesas@mailbox.org>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH/RFC 00/14] R-Car X5H Ironhide SCMI CPG/MDLC remapping
In-Reply-To: <cover.1776793163.git.geert+renesas@glider.be>
References: <cover.1776793163.git.geert+renesas@glider.be>
Date: Wed, 22 Apr 2026 15:48:37 -0700
Message-ID: <7hcxzqr4qi.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31513-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,arm.com,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[khilman@baylibre.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre.com:mid,baylibre-com.20251104.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 873CC44B580
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Geert Uytterhoeven <geert+renesas@glider.be> writes:

> 	Hi all,
>
> TL;DR:
>
>     Describe hardware in DT, and perform the mapping to SCMI in Linux.
>
> The Renesas R-Car X5H-based Ironhide board is the first Renesas
> SoC/board combination that implements the ARM System Control and
> Management Interface (SCMI).
>
> This means Linux can no longer perform various system operations (e.g.
> clock, power domain, and reset control) by accessing the hardware
> directly.  Instead, these operations are abstracted according to various
> SCMI sub-protocols, and Linux has to send messages to an SCMI-compliant
> firmware running on a System Control Processor (SCP).
> More specifically, the R-Car X5H SCP FW SCMI controls access to:
>   1. Core clocks and module clocks,
>   2. Module resets,
>   3. Power domains,

I'm very curious how power domain hierarchy is described on this SoC,
because one more issue to add to your list is that hierarchy cannot be
described for power domains in SCMI.

I know you're aware of it already, but just FYI for anyone else
exploring this space, I have a series[1] in-flight right now to address
this limitation of SCMI so that we can at least describe this hierarchy
in DT and the pmdomain framework.

Kevin

[1] https://lore.kernel.org/linux-pm/20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com/


