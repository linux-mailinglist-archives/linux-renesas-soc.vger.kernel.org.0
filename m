Return-Path: <linux-renesas-soc+bounces-12755-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14024A230B8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 16:01:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77B29188888F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 15:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA2F1BB6BC;
	Thu, 30 Jan 2025 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFlkmEG9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4357120E6;
	Thu, 30 Jan 2025 15:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738249288; cv=none; b=U2tSeQ6xvXgfiw0ZbcYYg/N3MugEpMiEicrSLUDtYYPypwO+uBSoeSWVrMCTaQBOgt+z715k/aBozgoW7MkVqssMpzCzrv2UxmnMC/RtJrL+VAulFFXv/9BqEd7wLZglZZ5GqzTc/qbdv7hnsiXIzwP5UjvEltCHkiUpdRfyVuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738249288; c=relaxed/simple;
	bh=r5SVPSaMbFSMZyc+0JaU/vFOwTAjWAoD2uLWb2cPld0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fw6a8kU1xQl6PRC4bvfZRTu0YrAd8XdBJp0We9agMWRkzO1ETaD2zMVp/0heM5kjmfyoHJrP8kAx2uWW03jetd5QXLHK/ki/0um1aFkogkdaD6UGtUW2Z7Ja1MtBng0njLKIgGet3MpBL4F5tS0tvx/7au73+vjsXK8mhkXjrsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFlkmEG9; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21631789fcdso27547895ad.1;
        Thu, 30 Jan 2025 07:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738249285; x=1738854085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6TjgtKHT9BmD8CWpsz/HgAipjKclSFtMrdtAxPUM3U=;
        b=KFlkmEG9EPpR7PA289Acv39Ztt0aq/8Q87p6s4lcZUWA8ICzc8WNrccRiVcTwftD/F
         8+ibasWEUm+jCrarrtO0wJezPYSAl6EbMnsoN1pnW8Xb7FYVoPSP2FnY0pBXIKTR3cvH
         RrlSZqD46Ll22euRXA4QFtvECy0hI+GvLQfNNlYblBc35+0YMMGSnAlIDnUDv/u+R/by
         7xwUfHpYA+CifDOwf4BYs8cT4eA/GfxsID3Au+ZPKPR6Fjt77kr2Zh+PYmSYBzfWFB80
         c8gJVMQYw8L6Y8zsaOJhgSGBQyHmAJzWlA0x7QkVAkVoHoc0gRrupwatDwovaa1tJO6C
         iEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738249285; x=1738854085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A6TjgtKHT9BmD8CWpsz/HgAipjKclSFtMrdtAxPUM3U=;
        b=v912vKMlIrl7lIx/+Ye7Nb2vJQ4zFi/LzhvroSpjh4FqiXKqdEsIp+IoS3qMmWu2aK
         8IGlDnIIX56gmG9ofKn1DUkpLkylQAF6TvHuzDxlPT2lluEthLLcaUtC6p5Bhdk+wcV+
         AYrscR/nVRhok1ZcB+CXZgCUxANEpp4TMAsvPMtCJdu65f7yaFapfIb6O8IGb1tN6Ien
         ZQE/TAV2ek1VYFbHV3N3P+qxYpnD8xtJ2pIsXDtGkmwKRvSwNrzTrzVW/r0zaADn0g08
         Zz60hUJLy+GWsv+JlD3FcBUmzI/glQRosPS+QOirzaHSlkpCVyGrf9fet5N0ofPl+Kkm
         fqsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/6bV7EMWCx8JnjdSkXxU6SAXm4Qm1OR57zwVxVzo4cBTCsVGMray+eSbYhggSNRJlfftJ6fEzLKpyPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHFFT0YEFSV9SfWucTU46G8Bgjm2HqfEpusKaAmYC+vwDhTlTk
	4vJJDvhkIBnCP4lMFW4VzfDMw1qZZOdZpFL1iYyI6om6LNIjRBrg
X-Gm-Gg: ASbGncvb7D0IwaotsK6WYfKJCiv5CPib5lSGcbJch5dNVnO+bgxzbftB8L5tCjlWhb7
	/xG3cxeWi2YjRYMsIoZKqAuaPj2Kk+HJFSxbgDyo0em1XMF67PUU/9lTRrU7HX9a0FduDgSVjsR
	kluCtvsCluwsgJ7zwWtql/VBvqQAye0mOqeoTnAV2F0xPS+jL7nliBfoPQ0wGZ83PEvZ+4efSV6
	l8iX2czQaEgbDvcYu5hxqMgErSn7Up3yceP5lOpcwBKJ3SCKb5k3KDS8L4A5oDexSgFBCwV18I8
	ZjmKgZRMgtLtCrW1h/1hRGiqoSnB
X-Google-Smtp-Source: AGHT+IEB69ZyCOobf/q9USTM9zh0Viv191uk3u+5lyM4rvdeZPYTQC8aYTqXcoPaKy0i1GVGNuNiVg==
X-Received: by 2002:a05:6a00:1247:b0:72a:a9d9:55ff with SMTP id d2e1a72fcca58-72fe2bdd85dmr4727897b3a.0.1738249285441;
        Thu, 30 Jan 2025 07:01:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ce4d9sm1525028b3a.153.2025.01.30.07.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 07:01:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Jan 2025 07:01:23 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Nuno Sa <nuno.sa@analog.com>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH RFT 2/6] hwmon: (ltc4282) Use per-client debugfs entry
Message-ID: <16a0eea6-b60e-42ca-b737-f3a246326d43@roeck-us.net>
References: <20250125123941.36729-8-wsa+renesas@sang-engineering.com>
 <20250125123941.36729-10-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250125123941.36729-10-wsa+renesas@sang-engineering.com>

On Sat, Jan 25, 2025 at 01:39:42PM +0100, Wolfram Sang wrote:
> The I2C core now offers a debugfs-directory per client. Use it and
> remove the custom handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Applied to hwmon-next.

Note that the branch will only be pushed to linux-next after the commit
window closed.

Thanks,
Guenter

