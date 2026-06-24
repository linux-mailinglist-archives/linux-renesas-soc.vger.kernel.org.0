Return-Path: <linux-renesas-soc+bounces-34389-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dnltK1KqO2oUbAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34389-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 11:58:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 520126BD1E1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 11:58:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dkaUqR50;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34389-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34389-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6345C301E5B6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 09:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3317F3AD50F;
	Wed, 24 Jun 2026 09:54:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15093B14D2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2026 09:54:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782294875; cv=pass; b=t+De+G9b9yTA6G+bJNVbYAu1ZMljNy09DwfLpeeCbrFqq1SJAkuTb47iVEV5OI8DjFlONsPxmcjrdtmG83pFmMEnTmiVc6SDHAOeCtOIlDoS6z5JZgv3N/cXB1TGgPsfH9knrwS9jUGIbqoLbyErLqqGQkZMDxbzNzWciPHu3Rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782294875; c=relaxed/simple;
	bh=G7McnGzDAgC/O+5kkADtYO2MXqBKflAE5Es+/QUD2pg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l1W1QwF1ak0gSE29BOkzd/b89VVlJS8l7mr9ST7/JCPsjEmyhC9+IdIsb8nbrZlwQN7ANn1l1SGEfckqx/NDXeFTQ73HExH0+T5qfdUdkYsxsGKEPzkAgEaedYbvNMSMbOVsoPfQrLen07/Z/p88gaPYmUk9BwGRIm3EzI3A6BE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkaUqR50; arc=pass smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso5566395e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2026 02:54:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782294872; cv=none;
        d=google.com; s=arc-20240605;
        b=d0k+Xem5Mvn6DqlPW6khM6bIZ03XGIq1BqWE9YwqkYTf9Ry7Yjz4IeXY53lbIlcnEO
         Gu6PVr24za6lbHFX6AluPj46Z14u+AAyDe8sg1fZ5xQ+mqC0tJOOKOjlZQPkdGKIA23W
         G/bvMY0IH2ynR/p4DBNXbpK/b7whRlqv0zJV+wH5gE8kdw6d7MHs04g/Hptgza8moZOq
         vT5KmNDiZiTl36MGlRZGEYzTcosA+/qxOBNKoJ9QRc37LNcUPB/DpQpS/uFe1BIarRU9
         e0FeG6H2LP+DNcJPxgFhNQ6cxeOCz9Hwfns1XqcvOQGnjQZKkRhLEk/xhda3ySt76Gwz
         kuag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ObqsI1pCoD4Da2/XxZ9CqBQX9rgxlXpIUEI/2gcibd4=;
        fh=bwMNu6oOJq+yP6nlvBWsg5+OC8JlL2+3M15z8IX0NEE=;
        b=lrzVeK0zy3xCzg8iXxrg/or/ztjUyFRCq6lOhWFOqltH7H58nrTvwgDLxvKVKBB9BS
         /UWgcOkT4sB97MhQI4aYwuz/6XZVWGfjDBz1Ph22W4btIT+W2LXsqvRrGhMNrasYqU4N
         oqRqgDu71opAQkw/d9DucuG2p1nlQXdPg9qExyWXLBfyMrWXYM7J2UA9/4Xqc7OiQXtl
         3YBomYdQj/tggLht4Q5BhllozBtZHN8fcjNfevk5ZEx/5Ixw+S+d0LG5Kpalu/a/AMJR
         SxHOB3/n8kKLQQO9Tm1RVB4tlnYNNTdhyjckR0jaVYCldY9c0DKSU/aShwQP4Hz8ugzA
         a/gQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782294872; x=1782899672; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObqsI1pCoD4Da2/XxZ9CqBQX9rgxlXpIUEI/2gcibd4=;
        b=dkaUqR50YTZlxtCAx72UdCM1RH7NxEvldd4TstWF1bQfzhwsIGA5bTSrQcByQCnqeH
         BIIquIz6sNMxeFubAAidHW/QfDgoBe6Se7/8lF5u448nmE6khdBcO3gh5uriBlcwSaV7
         dfnICjm+uf4oojzQjqINbkvK7GgEMrC/l+jam2jYd9++VcjD+Jr/msTMtT5u5Llv+AfM
         ydw9vr1SWMIRBub6Fnr+I0me72Z+1fLlVN3jr2PPwqC+8GL5b58Z8XycFO6L09UsOGdG
         BcPXuS4UsgRJbVZLO65YTVbaVAQ0pp+ALyCejnmhJY4ZR+bPb6s9VRCjxe6OuaO3kQ9V
         Zz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782294872; x=1782899672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ObqsI1pCoD4Da2/XxZ9CqBQX9rgxlXpIUEI/2gcibd4=;
        b=Z0lGIZj6U03TVypYwhDkvQnUQPqpj3sNcus438hLI5rNIrNA5rEMEvGyMBJVBS6onu
         ADtgVPdrE54RxwZ2ahkpl4HgSEGekOCvBQ3RtXNXlYsIZrKss/xulJk25N1fn7cKECZ8
         BFbu5XQ0gRjjX3r4Sk3qLeaSkczC6McZ5IKF8y8LiJYgr1A4BobYkFtdalf0YaRlj1SC
         Nvtr2+aKkHnnSXqFVG/8HqNk/Cukb38YgeLmz9KTJztYXUvuVaevMFNwMhCPpmZDaYrZ
         Bgn810pnkVYodx7+n0/MSsepWazOAHnEKCnfpdh0+AZdCeP4CAnW387uOx5lAvNV3L43
         sMaA==
X-Forwarded-Encrypted: i=1; AFNElJ+GG8vroOORs8N51Vx/pcciXlDiDY4HPxQl30hYOkIKgPeM0nxYkcrgyPYwv18+rfW0BPVf7yA28M9Ln7bP3Ed78w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwA2L2k137WvnWjk5x73BjYT+37wzm+dttNSYdlbmjZFOveD7ic
	8+Dek3sfUQseiUne/yno4ywFcUP7EbyA2kFL4d3iltLVxpdNLSLcwWGFEd1YR1CN9T3eazHE+5s
	xiFAZOb/S/0VBi42spP7z2RHH2lJTDJ8=
X-Gm-Gg: AfdE7clkCeLRSnr8SHyGZf9anQUACXjZw5RofFTIB2e5oqfzVBDVwRPPBTa1ybxcBFV
	T/VBFnTCLy397rcpd1bk6wDNULA0CzR1ugzSGo4pWzVAUpzlVuXnP96uoTxqE4g382EDIoWLTZ9
	YxfDrsWGlP4CTHTfWPHFyxTgndc8G6EbFCjrtZRIRuMWQpPERQ00DvctKE5TgMN0l2nE/7YplvA
	C75y7Kq41qR9OzgHIZ9oKuVJDSz7U55QPazDHnhLuZRqaquxJ/DB7gjGslEnRHV0F5fPgiKIoZM
	ancSRfV5SH4RdaJIOwsK73JPyBlXb0+CvTDOOLezOMCrAzzMayPmjTDG94zL
X-Received: by 2002:a05:600c:4f93:b0:490:3f7a:108b with SMTP id
 5b1f17b1804b1-49260852341mr31752025e9.16.1782294871891; Wed, 24 Jun 2026
 02:54:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ajJ9kNJtrY6DyQ-S@shikoro> <CA+V-a8u2wt6623mYjhipOvJPo4va+bXs3qirQewocFr2QmUFhA@mail.gmail.com>
 <ajr1wXCI2U23d1sY@shikoro>
In-Reply-To: <ajr1wXCI2U23d1sY@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 24 Jun 2026 10:53:53 +0100
X-Gm-Features: AVVi8Cevqm9oqdlggQH1rMr7Spj8hW-dVFTCrlA4kct0_6oDoVWBpLIfXWaxx4Y
Message-ID: <CA+V-a8tfb5YFsh-K5F8OOBsuJi0PG72vQ=2PQb2avVNF8-kcrQ@mail.gmail.com>
Subject: Re: [PATCH 07/12] rtc: rzn1: fix alarm range check truncation on
 32-bit systems
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34389-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:wsa@sang-engineering.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,sang-engineering.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 520126BD1E1

Hi Wolfram,

On Tue, Jun 23, 2026 at 10:08=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Can you please share the commands you tried, I'll try and replicate it
> > on my side.
>
> Sorry, can't give you the commands, just from my head: I tried to set an
> alarm more than a week in the future, and the alarm was set to the next
> day. But I was in a hurry, maybe I overlooked something, because that
> handling used to work in the past IIRC. I can return to this topic on
> Friday earliest, sadly. Maybe next week only...
>
I ran some tests for cases #1 and #2, and we see an out-of-range
error. By adding a 1-sec leeway when checking the ranges I don't get
the out-of-range error. Let me know what you think (I'll create a
seprate patch for it).

Case #1 reverting this patch:

root@rzn2h-evk:~# date -s "2026-06-24 10:34:00"; hwclock -w;
Wed Jun 24 10:34:00 UTC 2026
root@rzn2h-evk:~#
root@rzn2h-evk:~#
root@rzn2h-evk:~# rtcwake -m no -s 604800;cat /proc/driver/rtc
rtcwake: set rtc wake alarm failed: Numerical result out of range
rtc_time        : 10:34:32
rtc_date        : 2026-06-24
alrm_time       : 10:34:33
alrm_date       : 2026-07-01
alarm_IRQ       : no
alrm_pending    : no
update IRQ enabled      : no
periodic IRQ enabled    : no
periodic IRQ frequency  : 1
max user IRQ frequency  : 64
24hr            : yes
root@rzn2h-evk:~#

Case #2 with this patch:
root@rzn2h-evk:~# date -s "2026-06-24 10:46:00"; hwclock -w;
Wed Jun 24 10:46:00 UTC 2026
root@rzn2h-evk:~# rtcwake -m no -s 604800;cat /proc/driver/rtc
rtcwake: set rtc wake alarm failed: Numerical result out of range
rtc_time        : 10:46:30
rtc_date        : 2026-06-24
alrm_time       : 10:46:31
alrm_date       : 2026-07-01
alarm_IRQ       : no
alrm_pending    : no
update IRQ enabled      : no
periodic IRQ enabled    : no
periodic IRQ frequency  : 1
max user IRQ frequency  : 64
24hr            : yes
root@rzn2h-evk:~#

Case #3: Add 1-sec  leeway:
root@rzn2h-evk:~# date -s "2026-06-24 10:48:00"; hwclock -w;
Wed Jun 24 10:48:00 UTC 2026
root@rzn2h-evk:~# rtcwake -m no -s 604800;cat /proc/driver/rtc
rtcwake: wakeup using /dev/rtc0 at Wed Jul  1 10:48:50 2026
rtc_time        : 10:48:49
rtc_date        : 2026-06-24
alrm_time       : 10:48:50
alrm_date       : 2026-07-01
alarm_IRQ       : yes
alrm_pending    : no
update IRQ enabled      : no
periodic IRQ enabled    : no
periodic IRQ frequency  : 1
max user IRQ frequency  : 64
24hr            : yes
root@rzn2h-evk:~#


Changes for case #3:

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 173526d50d41..8fdb5114a6d8 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -279,7 +279,9 @@ static int rzn1_rtc_set_alarm(struct device *dev,
struct rtc_wkalrm *alrm)
        /* We cannot set alarms more than one week ahead */
        farest =3D rtc_tm_to_time64(&tm_now) + rtc->rtcdev->alarm_offset_ma=
x;
        alarm =3D rtc_tm_to_time64(tm);
-       if (alarm > farest)
+
+       /* Add a 1-second leeway for processing delay */
+       if (alarm > (farest + 1))
                return -ERANGE;

        /* Convert alarm day into week day */


Cheers,
Prabhakar

