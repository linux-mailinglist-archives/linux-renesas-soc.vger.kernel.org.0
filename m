Return-Path: <linux-renesas-soc+bounces-6682-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 302E29148C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 13:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4365F1C23300
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 11:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303B1441D;
	Mon, 24 Jun 2024 11:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iH+vbe2j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1140138495
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jun 2024 11:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719228707; cv=none; b=cUfqn4QqT+tzu4YSnCDah4CKqsQnHJgPdOgK9phZYOcCTHPdQ6qT/g8nqJ/b7oIO9VbYZyPolp8zn1dpgitVkuC//5EtxAf2xQDIewjkn3oMRxUnJ/XyoxZyN6WDdk5iWWLHzusC3Xbzn8VrQw9VFOMjmZclMyz3LlkqPk5eHbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719228707; c=relaxed/simple;
	bh=PLsJnmgzNEr0q4/QEXYiEXtI2V426A0O6oJ503oVeyA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=i/hgFH1eoq/Iolru7YEuow9PJYl24o2VFLfsSPw8EXtBdfHEFqnAthzN2sNZzHYwPzyUDlc3SedeRwZVduKKd44n36NRgUFOm6OyEGjRjldhdz3liFnV0QmBHvEBGwnwQVkupkqgG+VCGBoOWr5qpHEIuq/gHy/bs5Bx0d0Dzaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iH+vbe2j; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719228704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z1Rc1emYuXh/HewWkHo067TK+khtKA7f3ilfM7ZwWq0=;
	b=iH+vbe2jyKO6CYIICIJy+qw/3TpZ1txpQTyY8BgeZR9OOmVEaSBggqsEBa5VA7Wbs0VeMQ
	n5nR3Ug8KleFOw3KsA/VoszOAzePYdaplZ3l0nvnihrUqpd3tDW8Owpvg0vKVYC6XH4W56
	TVpfzTOiiPzNOORK+ZLrYinIF7NmKKA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357--I9Wn81nMg2G03W0HwVlxA-1; Mon, 24 Jun 2024 07:31:43 -0400
X-MC-Unique: -I9Wn81nMg2G03W0HwVlxA-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-366e0a4c965so980149f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jun 2024 04:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719228702; x=1719833502;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z1Rc1emYuXh/HewWkHo067TK+khtKA7f3ilfM7ZwWq0=;
        b=eY5vTZFQdFwNrXdcNDARkKM/QYthicW0IKEHFSs4pmuQgCTs9NFkI63g6/ybgqlSP9
         Q2fJXZ+BNe3Nr0qXTD6OWE/m+uu6IoWWHzNia2solOog77msYgqP0K5Ehb2RXTEzKqKE
         QHrgWY5NqmsHI60oZsiilJ2w0JXjMowqNfRGLMbuo5N5VSn4h1hJybZ9HPp9ogUFO8SD
         fWq94bExDZa4Smsu1aHqKjnrRvHg6VXd3cEMpZCeS9EgCpVKSznTZivgrrrus19rRzfo
         WvqUFZUVuE0hUnt+IT+DKtTPF2HiyX3mHEr3Oubh4QTV8E/g6QlADMb6tjt1SJ+vIEm6
         A8pA==
X-Forwarded-Encrypted: i=1; AJvYcCUAMYkTsgQkLfn7gwAgDzWoo8x3NuZjjJ6ANpOnA04HcWYXaUmNWz0YouHroMGQN3ZLlMdbuXmvcvXj68MN4+TV1r64HEJswcHu83iMyxshc2M=
X-Gm-Message-State: AOJu0Yzb32CWsMqBfLusdgY0KEIIATc/5a0+2aQ7PrasqThySczJZkay
	XwE3uq/zqcISz3orw62ZqsHpVgxX37ez8jrr2MhuHaXynwX7hflPx1JnrfulTDgBAcDdMUcwWYo
	5p2HuzJCs49wHA0xXj6Cv4lBHlvyo3l8aZNqMTsKtbBaiKGHxtpATjkkpv4NOA+zXcxje
X-Received: by 2002:a05:6000:1a8d:b0:366:f00f:8656 with SMTP id ffacd0b85a97d-366f00f8687mr2489934f8f.55.1719228702102;
        Mon, 24 Jun 2024 04:31:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEjXWAJo0A3ZGNhrE3FY0LNEuVP1fHqKxJAk1B5YvPPlS1HLStfakEN0O/4kfL+9PdRhZvqA==
X-Received: by 2002:a05:6000:1a8d:b0:366:f00f:8656 with SMTP id ffacd0b85a97d-366f00f8687mr2489920f8f.55.1719228701746;
        Mon, 24 Jun 2024 04:31:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e? ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366389b8922sm9792777f8f.28.2024.06.24.04.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 04:31:41 -0700 (PDT)
Message-ID: <2f54c321-1832-4931-8148-5eece4ef4915@redhat.com>
Date: Mon, 24 Jun 2024 13:31:40 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] drm/panic: Fixes and graphical logo
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1718305355.git.geert+renesas@glider.be>
 <b4caed34-bed4-4b72-9bb0-353ef63fe867@redhat.com>
Content-Language: en-US, fr
In-Reply-To: <b4caed34-bed4-4b72-9bb0-353ef63fe867@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/06/2024 10:55, Jocelyn Falempe wrote:
> Hi,
> 
> I want to push at least the first patch that is an important fix.
> But if there are no objections, I can push the whole series except patch 
> 5 "drm/panic: Convert to drm_fb_clip_offset()" which causes some build 
> issue.

I just pushed them to drm-misc-next.
Thanks all.

> 
> Best regards,
> 


