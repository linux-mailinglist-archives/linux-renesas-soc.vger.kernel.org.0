Return-Path: <linux-renesas-soc+bounces-9833-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6B79A309B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 00:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF8F0B219CF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2024 22:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563481D7E37;
	Thu, 17 Oct 2024 22:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VeSe/Jxf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4128B1D61AF;
	Thu, 17 Oct 2024 22:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729203798; cv=none; b=BQ2/ttcKwAVP7GFsefCvm7ffCugWpp+Pg0Qpe1175njL/+DgPS0R1TuIPoDUwxiwsp/PtgKFGXRek0f2Z+7XprUMTzmu/oyIU8c6qvAwx6b4PNTCGS7/vyixd0GblCluGsy2cV2+lvlPPweXPmeUoltwkfFjiF26hNIqVJULXvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729203798; c=relaxed/simple;
	bh=QYhmAmLP2nPzlbUsoASoKDmHWKjUctENSTsKZahkwFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tM37o7o3Ran1yEEVwl0Qc9ae3rK2JX1aGgX1UxE/uIc5+sZfOEKO4d6/VnzKEVf7OWZizI3fVKwpoDkUURb7KuNomMsugYu9i3uNVPdX3eL6BPOc6oWjVNcvRJsyZt/9PRq8bkDEz8oXTUmX7n/L/+rq+mklyVcDTVyqaJtsg08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VeSe/Jxf; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e983487a1so736407b3a.2;
        Thu, 17 Oct 2024 15:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729203792; x=1729808592; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z1qrbLXwNBIakYwgTs8RIOIeir05sW7FvJD9Nk1kl0I=;
        b=VeSe/Jxfc+ZLuOI/emF3UNV5lgbKcL4YLkjWa6aBXOgXcVen9E5M3Whia8bCJSsetX
         WoP5Vm2AJF3/yH7Ejpoh3X83EBm25TYcWUw9AlMkmuIDGyauqCjKJ7XwsgCN3lE0P0BB
         V+G3GaWKCDcdts7IXUwZ1VTVNgaJCmlqGlF8L01WxJMxA9s5QPqJPdA/6O50XLoJqtEo
         PqOGkxC84SEi3L+46JTx7zEturuDiVbAdtmiq6UWqpCLSY/PocjbNEpRifnBUY9C3Y28
         7osvCsBRA8W1WosPme+4jr3Xc9QfcJ5jeXuuKoRfyK0gHYbAMIr8Y6rJCd72QIr/PfVQ
         Qcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729203792; x=1729808592;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1qrbLXwNBIakYwgTs8RIOIeir05sW7FvJD9Nk1kl0I=;
        b=et9KmT3imvntin78DEEUxPMGUGqtjQGxgJOJ1KKrSg6penhnWVCLa3ykSOSBb3M9Cd
         uxaxkpUBC5cgbIqK9FVHga4+2sk5dWLoL9X4NPvqMgSRqQ6W2QXQtOvixCAWuIUJqPzp
         arFo96EQgC80dOTihOvRNBKixL2Q0Stfs/XxeS0FEvYdZw1B9hVtr0CKMK0nNhu5hh6N
         KbXQewpS8Oiu1ED+0b+97zkrSEIGDfhZVSux+PtvAYDXfvYpxDb6fRuYyJFVg2IKs83K
         0M3qjeXTbtVIj+2Y09FKqKJjZTsh6VC/XhyubkWDuESHgb/+23RsarMa50n+m/lYc3J+
         tB8w==
X-Forwarded-Encrypted: i=1; AJvYcCUx+2cJdXzX1z1ZJRFAogTj04ky1LXoVSBNMSOYvjUA2kthYMdYo0hg3LEFVXVAh3hClGmamRRd/zDT@vger.kernel.org, AJvYcCVcxsJx7Iu9QnznIktn7OsK0452bRpM60oipCRt5hETpUxvEcLxpH8votKiaJR9ex+eHEuTxSamt3K0xlIX@vger.kernel.org, AJvYcCVgSEh1DhEWLgGOp7PUPMNKnqtlgtn7loX1gKrCvqECmODy11Sj93llO/DlwkMLxZb/QeeuPFjgNYkAuQ8=@vger.kernel.org, AJvYcCW3TPNPr+xSYCeK+kVu4RVi6X7TVAi8czX3sV3sgFfN+QVoV7ODp92+fKzjiEYbrRAkgdHJwUytcIdx@vger.kernel.org, AJvYcCWaijxzsPNZu3muO+eOE6ZK/vEj+J4/RNHj2E77xc/VqQoK0viGE+5/VTSxKyAOMUAyzB63yVzcd1l85D4iH7LBhPk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3waNSX4pwZ4elN5r6CmmYVPmyjruDV1RLA1iCDeeIl4/Nmf1K
	JRoSprRnD6E69d/4DiWYeQo26IcGuc3gjklmo2MUf5DP44PeYOg6
X-Google-Smtp-Source: AGHT+IEACbmCkP4uPX7tIuqeK5pwHkpGEuKMQNoS5Rs2gqNlMpwudEdjicf8cxKS21s2VavzC72BzQ==
X-Received: by 2002:a05:6a00:1913:b0:71e:4c01:b3da with SMTP id d2e1a72fcca58-71ea31d28dfmr587637b3a.5.1729203792405;
        Thu, 17 Oct 2024 15:23:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea34a7fa8sm155263b3a.184.2024.10.17.15.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 15:23:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 17 Oct 2024 15:23:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
Cc: patrick@stwcx.xyz, Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Carsten =?iso-8859-1?Q?Spie=DF?= <mail@carsten-spiess.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v8 2/2] hwmon: (isl28022) new driver for ISL28022 power
 monitor
Message-ID: <099949db-2436-4479-8ccd-bbabcd174c7d@roeck-us.net>
References: <20241002081133.13123-1-yikai.tsai.wiwynn@gmail.com>
 <20241002081133.13123-3-yikai.tsai.wiwynn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241002081133.13123-3-yikai.tsai.wiwynn@gmail.com>

On Wed, Oct 02, 2024 at 04:11:30PM +0800, Yikai Tsai wrote:
> Driver for Renesas ISL28022 power monitor with I2C interface.
> The device monitors voltage, current via shunt resistor
> and calculated power.
> 
> Signed-off-by: Carsten Spieﬂ <mail@carsten-spiess.de>
> Signed-off-by: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>

There are several alignment issues. I fixed those up, no need to resend.

Applied.

Thanks,
Guenter

